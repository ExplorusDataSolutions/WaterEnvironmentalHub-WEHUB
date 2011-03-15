require 'rexml/document'
require 'net/http'

class GeoNetworkTranslator
  attr_accessor :server_address, :search_uri

  @@cached_search_query = {}
  @@cached_metadata = {}
  
  def initialize(server_address = '174.129.10.37')
    @server_address = server_address
  end

  def cached_metadata
    @@cached_metadata
  end
  
  def cached_search_query
    @@cached_search_query
  end

  def search_results_by_groups(group_ids)
    query = group_ids.sort.join(',')
    if cached_search_query.has_key?(query)
      search_terms = cached_search_query.fetch(query)
    else 
      groups_xml = ''
      group_ids.each do |id|
        groups_xml << "<group>#{id}</group>"
      end
       
      response = post("xml.search", "<request>#{groups_xml}</request>")
      search_terms = response.body
      
      cached_search_query.store(query, search_terms)
    end    
    
    translate_to_search_results(search_terms)
  end
  
  def search_results(query)
    if cached_search_query.has_key?(query)
      search_terms = cached_search_query.fetch(query)
    else  
      response = post("xml.search", "<request><any>#{query}</any></request>")
      search_terms = response.body
      cached_search_query.store(query, search_terms)
    end    
    
    translate_to_search_results(search_terms)
  end
  
  def search_result(id)
    if cached_metadata.has_key?(id)
      result = cached_metadata.fetch(id)
    else
      result = search_results(id).first

      cached_search_query.store(id, result)
    end    
    
    result
  end

  def translate_to_search_results(xml)
    search_results = []
    doc = REXML::Document.new(xml)
    doc.elements.each('response/metadata/geonet:info') do |item|
      publication_date = item.elements['createDate'].text
      uuid = item.elements['uuid'].text
      if !uuid.empty? && !publication_date.empty?
        search_results.push(SearchResult.new(nil, nil, publication_date, uuid))
      end
    end

    search_results.each_with_index do |result, index|
      search_results[index] = augment_search_result(search_results[index])
    end
    
    search_results
  end
  
  def augment_search_result(result)  
    if cached_metadata.has_key?(result.id)
      result = cached_metadata.fetch(result.id)
    else    
      response = post("xml.metadata.get", "<request><uuid>#{result.id}</uuid></request>")
      
      doc = REXML::Document.new(response.body)
      doc.elements.each('Metadata') do |item|
        result.description = item.elements['dataIdInfo/idAbs'].text
        result.title = item.elements['dataIdInfo/idCitation/resTitle'].text
      end
      
      cached_metadata.store(result.id, result)
    end
    
    result    
  end
  
  def post(uri, xmlRequest)
    if @cookies == nil && uri != "xml.user.login"
      authenticate
    end
    puts "Posting #{xmlRequest} to #{uri}"
    url = URI.parse("http://#{server_address}:8080/geonetwork/srv/en/#{uri}")
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
      puts "Success!"
    else
      response.error!  
    end
  end
  
  def authenticate(username='development', password='development')
    puts "Authenticating user #{username} with GeoNetwork"
    
    response = post("xml.user.login", "<request><username>#{username}</username><password>#{password}</password></request>")
    
    @cookies = response['set-cookie']
  end
  
end