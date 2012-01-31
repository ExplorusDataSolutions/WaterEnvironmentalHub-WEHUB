require 'rexml/document'
require 'net/http'
require 'active_support/core_ext'

class GeoNetworkTranslator
  attr_accessor :server_address, :cache
 
  def initialize(server_address='http://localhost:9090', cache={})
  @server_address = server_address
    @cache = cache
  end
 
  def cache_key(query)
    "search_results_#{query}"
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
      cache.write(cache_key(query), results)
    end   
    
    results 
  end
  
  def search_results(query)
    results = nil
    if cache.exist?(cache_key(query))
      results = cache.fetch(cache_key(query))
    else  
      response = post("xml.search", "<request><any>#{query}</any></request>")
      search_terms = response.body
  
      results = translate_to_search_results(search_terms)
      cache.write(cache_key(query), results)
    end    

    results
  end

  def search_results_advanced(query, date_start, date_end, south, east, north, west)
  
    bounds = ''
    if ((south && !south.empty?) && (east && !east.empty?) && (north && !north.empty?) && (west && !west.empty?)) 
      bounds = "<eastBL>#{east}</eastBL><southBL>#{south}</southBL><northBL>#{north}</northBL><westBL>#{west}</westBL>"
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
      response = post("xml.search", "<request><any>#{query}</any>#{bounds}#{date}</request>")  
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
      result = search_results(id).first

      cache.write(cache_key(id), result)
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
        result.owner = Hashie::Mash.new(additional_info['owner'])
        result.author = Hashie::Mash.new(additional_info['author'])
        result.coordinates = additional_info['coordinates']
        result.review_summary = Hashie::Mash.new(additional_info['review_summary'])

        keywords = []
        item.elements.each('dataIdInfo/descKeys') do |keyword|
          keywords.push(keyword.elements['keyword'].text)
        end
        
        if !keywords.empty?
          result.properties = keywords.join(', ').chop!
        end
      end
      
      cache.write(cache_key(result.id), result)
    end
    result    
  end
  
  def post(uri, xmlRequest)
    if @cookies == nil && uri != "xml.user.login"
      authenticate
    end
    puts xmlRequest
    url = URI.parse("#{server_address}/geonetwork/srv/en/#{uri}")
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?>#{xmlRequest}"
    request.content_type = "text/xml"
    request['cookie'] = @cookies
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    check_response(response)
    
    response
  end

  def check_response(response)
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
    else
      puts response.body
      response.error!  
    end
  end
  
  def authenticate(username='development', password='development')
    puts "Authenticating user #{username} with GeoNetwork"
    
    response = post("xml.user.login", "<request><username>#{username}</username><password>#{password}</password></request>")
    
    @cookies = response['set-cookie']
  end
  
  def refresh
#    cache.clear()
  end
  
end
