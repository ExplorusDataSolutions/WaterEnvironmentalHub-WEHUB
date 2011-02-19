require 'rexml/document'
require 'net/http'

class GeoServerTranslator
  attr_accessor :server_address, :search_uri
  
  def initialize(server_address = '174.129.10.37')
    @server_address = server_address
    @search_uri = "http://#{server_address}:8080/geoserver/ows?service=wfs&version=1.1.0&request=GetCapabilities"
  end
  
  def translate(xml)
    search_result = []
    if !xml.empty?
      doc = REXML::Document.new(xml)
      doc.elements.each('WFS_Capabilities/FeatureTypeList/FeatureType') do |feature|
        id = feature.elements['Name'].text
        title = feature.elements['Title'].text
        description = feature.elements['Abstract'].text
        
        search_result.push(SearchResult.new(description, title, nil, nil, nil, nil, id))
      end
    end    
    
    search_result
  end
  
  def capabilities
    url = URI.parse(@search_uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    translate(response.body)
  end
end