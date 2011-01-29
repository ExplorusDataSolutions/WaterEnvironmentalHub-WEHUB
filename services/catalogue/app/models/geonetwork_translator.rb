require "rexml/document"

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
        
        resources = []
        
        item.elements.to_a('link').each do |link, index|
          if link.attributes['href'] != nil || link.attributes['href'] != nil || link.attributes['type'] != nil
            resources.push(Resources.new(link.attributes['href'], link.attributes['title'], link.attributes['type']))
          end
        end
        
        media_content = item.elements['media:content']
        if media_content != nil
          thumbnail = media_content.attributes['url']
        end
        
        source = 'geonetwork'
        
        publication_date = item.elements['pubDate'].text
        
        if title != nil
          search_result.push(SearchResult.new(description, title, resources, thumbnail, source, publication_date))
        end
      end
    end
    
    search_result
  end
  
  def search_results(query)
    url = URI.parse(@search_uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><any>#{query}</any></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
   
    translate_from_search(response.body)    
  end
end