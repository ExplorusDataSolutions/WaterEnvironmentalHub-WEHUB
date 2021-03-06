require 'rexml/document'
require 'net/http'
require 'active_support/core_ext'

class GeoNetworkTranslator
  attr_accessor :server_address, :cache
 
  def initialize(server_address='http://localhost:9090', cache={})
  @server_address = server_address
    @cache = cache
  end
 
  def cache_key(query, request='')
    if request.nil? || request.empty? || request == 'auto'
      "search_results_#{query}"
    else
      "search_results_#{query}_#{request}"
    end
  end
  
  def cookies_cache_key
    "search_cookies"
  end

  def search_results_by_groups(group_ids)
    results = nil
    query = group_ids.sort.join(',')
    if cache.exist?(cache_key(query))
      results = cache.fetch(cache_key(query))
    else 
      groups_xml = ''
      group_ids.each do |id|
        groups_xml << "<group>#{id}</group>"
      end
       
      response = post("xml.search", "<request>#{groups_xml}</request>")
      search_terms = response.body
      
      results = translate_to_search_results(search_terms)
      cache.write(cache_key(query), results) unless !results || results.empty?
    end   
    
    results 
  end
  
  def search_results(query, request='auto')
    results = nil
    if cache.exist?(cache_key(query, request))
      results = cache.fetch(cache_key(query, request))
    else 
      if query == 'all' && request == 'auto'
        response = post("xml.search", "<request><any>#{query}</any></request>")
      elsif query == 'all' && request == 'order_by_date'
        response = post("xml.search", "<request><any>#{query}</any><sortBy>changeDate</sortBy></request>")
      elsif request == 'uuid'
        response = post("xml.search", "<request><uuid>#{query}</uuid></request>")
      elsif request == 'properties'
        response = post("xml.search", "<request>#{build_properties(query)}#{build_keywords(query)}</request>")
      else
        response = post("xml.search", "<request><any>#{query}</any></request>")

      end
      search_terms = response.body
  
      results = translate_to_search_results(search_terms)
      cache.write(cache_key(query, request), results) unless !results || results.empty?
    end    

    results
  end

  def search_results_advanced(query, date_start, date_end, south, east, north, west)
    if query == 'all'
      query = { :keywords => '' }
    end
    
    bounds = ''
    if ((south && !south.empty?) && (east && !east.empty?) && (north && !north.empty?) && (west && !west.empty?)) 
      bounds = "<eastBL>#{east}</eastBL><southBL>#{south}</southBL><northBL>#{north}</northBL><westBL>#{west}</westBL><relation>overlaps</relation><sortBy>relevance</sortBy><attrset>geo</attrset>"
    end
    
    date = ''
    if ((date_start && !date_start.empty?) && (date_end && !date_end.empty?))
      date_start = Time.parse(date_start).iso8601
      date_start = date_start.split('T')[0]
      date_end = Time.parse(date_end).iso8601
      date_end = date_end.split('T')[0]
      date = "<extFrom>#{date_start}</extFrom><extTo>#{date_end}</extTo>"      
    end

    search_terms = nil
    
    begin
      response = post("xml.search", "<request>#{build_properties(query)}#{build_keywords(query)}#{bounds}#{date}</request>")  
      search_terms = response.body
    rescue
    end

    translate_to_search_results(search_terms)
  end
  
  def search_result(id)
    result = nil
    if cache.exist?(cache_key(id))
      result = cache.fetch(cache_key(id))
    else
      result = search_results(id, 'uuid').first

      cache.write(cache_key(id), result) unless !result
    end    
    
    result
  end

  def translate_to_search_results(xml)
    search_results = []
    doc = REXML::Document.new(xml)
    doc.elements.each('response/metadata/geonet:info') do |item|
      uuid = item.elements['uuid'].text

      if !uuid.empty?
        result = SearchResult.new(uuid)
        result.date = item.elements['createDate'].text

        search_results.push(result)
      end
    end

    search_results.each_with_index do |result, i|

      search_results[i] = augment_search_result(search_results[i])
    end
    
    search_results
  end
  
  def augment_search_result(result)  
    if cache.exist?(cache_key(result.id))
      result = cache.fetch(cache_key(result.id))
    else    
      response = post("xml.metadata.get", "<request><uuid>#{result.id}</uuid></request>")

      doc = REXML::Document.new(response.body)

      doc.elements.each('Metadata') do |item|
        result.description = item.elements['dataIdInfo/idPurp'].text

        additional_info = JSON.parse(item.elements['additionalInfo'].text)
        result.period = additional_info['period']
        result.name = item.elements['dataIdInfo/idCitation/resTitle'].text
        #Geonetwork won't search between round brackets so we added spaces so the terms are searchable, now we're removing the spaces
        result.name.gsub!('( ','(')
        result.name.gsub!(' )',')')        
        result.owner = Hashie::Mash.new(additional_info['owner'])
        result.author = Hashie::Mash.new(additional_info['author'])
        result.coordinates = additional_info['coordinates']
        result.review_summary = Hashie::Mash.new(additional_info['review_summary'])

        properties = additional_info['properties']
        if properties
          result.properties = properties.gsub(',', ', ')
        end

        keywords = []
        item.elements.each('dataIdInfo/descKeys') do |keyword|
          keywords.push(keyword.elements['keyword'].text)
        end
        
        if !keywords.empty?
          result.keywords = keywords.join(', ')
        end
        
      end
      
      cache.write(cache_key(result.id), result) unless !result
    end
    result    
  end
  
  def post(uri, xmlRequest, depth=0)
    if !cache.exist?(cookies_cache_key) && uri != "xml.user.login"
      cache.write(cookies_cache_key, authenticate)
    end
    puts "GeoNetwork request: #{xmlRequest}"
    url = URI.parse("#{server_address}/geonetwork/srv/en/#{uri}")
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?>#{xmlRequest}"
    request.content_type = "text/xml"
    request['cookie'] = cache.fetch(cookies_cache_key)
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
    when Net::HTTPForbidden
      # try authenticating again
      if depth == 0
        cache.delete(cookies_cache_key)
        post(uri, xmlRequest, depth+1)
      end
    else
      puts "Geonetwork error: #{response.body}"
      response.error!  
    end

    if !response.body.match(/summary count="0"/).nil? && depth == 0
      # sometimes we get an empty response when we're not authenticated, so... try authenticating again    
      cache.delete(cookies_cache_key)
      post(uri, xmlRequest, depth+1)
    else  
      response
    end
  end
  
  def build_properties(query)
    query[:properties] && !query[:properties].empty? ? "<themekey>#{query[:properties].downcase}</themekey>" : ''
  end
  
  def build_keywords(query)
    query[:keywords] && !query[:keywords].empty? ? "<any>#{query[:keywords]}</any>" : ''
  end

  def authenticate(username='development', password='development')
    puts "Authenticating user #{username} with GeoNetwork"
    
    response = post("xml.user.login", "<request><username>#{username}</username><password>#{password}</password></request>")
    
    response['set-cookie']
  end
    
end
