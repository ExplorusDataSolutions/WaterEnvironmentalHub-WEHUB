require 'rexml/document'
require 'net/http'

class GeoNetworkTranslator
  attr_accessor :server_address, :search_uri
  
  def initialize(server_address = '174.129.10.37')
    @server_address = server_address
    @search_uri = "http://#{server_address}:8080/geonetwork/srv/en/rss.search"
  end
  
  def translate_from_search(xml)
    
    search_result = []
    if !xml.empty?
      xml = xml.gsub(/localhost/, server_address)
      
      doc = REXML::Document.new(xml)
      doc.elements.each('rss/channel/item') do |item|
        
        title = item.elements['title'].text
        
        description = item.elements['media:text'].text

        media_content = item.elements['media:content']
        if media_content != nil
          thumbnail = media_content.attributes['url']
        end
        
        source = 'geonetwork'
        
        publication_date = item.elements['pubDate'].text
        
        id = item.elements['uuid'].text
        
        if title != nil
          search_result.push(SearchResult.new(description, title, nil, thumbnail, source, publication_date, id))
        end
      end
    end
    
    search_result
  end
  
  def search_results(query)
    if @cookies == nil
      authenticate
    end
    
    url = URI.parse(@search_uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><any>#{query}</any></request>"    
    request.content_type = "text/xml"
    request['cookie'] = @cookies
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
   
    translate_from_search(response.body)
  end
  
  def search_results_by_group(group_ids)  
    if @cookies == nil
      authenticate
    end
    url = URI.parse(@search_uri)
    request = Net::HTTP::Post.new(url.path)
    
    groups_xml = ''
    group_ids.each do |id|
      groups_xml << "<group>#{id}</group>"
    end

    request.body = "<?xml version='1.0' encoding='UTF-8'?><request>#{groups_xml}</request>"    
    request.content_type = "text/xml"
    request['cookie'] = @cookies
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}    
    
    translate_from_search(response.body)    
  end
  
  def authenticate(username='development', password='development')
    puts "Authenticating user #{username} with GeoNetwork"    
    
    url = URI.parse("http://#{server_address}/geonetwork/srv/en/xml.user.login")  
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>#{username}</username><password>#{password}</password></request>"    
    request.content_type = "text/xml"
    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts "Success!"
      @cookies = response['set-cookie']
    else
      response.error!  
    end    
  end

end