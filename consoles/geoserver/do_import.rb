require 'active_support/core_ext'
require 'rexml/document'
require 'net/http'

def http_get(url_param)
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  response = http.start {|http| http.get(url.to_s) }
  
  response.value
  
  response.body
end

def add_to_catalogue(uri, request)
  puts "Updating Catalogue"

  timeout = 500
  url = URI.parse(uri)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  
  response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }

  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Success, record for #{response.body} updated"
  else
    puts "Failure, record for #{response.body} was not updated"
  end
  
end

catalogue_uri = 'http://localhost:3000/items/load_geoserver_content'
geoserver_base = 'http://localhost:8080/geoserver'
xml_capabilities = http_get("#{geoserver_base}/ows?service=wfs&version=1.1.0&request=GetCapabilities")

if !xml_capabilities.empty?
  doc = REXML::Document.new(xml_capabilities)
  doc.elements.each('WFS_Capabilities/FeatureTypeList/FeatureType') do |feature|

    uuid = feature.elements['Name'].text
    if !uuid.scan(':').empty?
      uuid = uuid.split(':')[1] 
    end

    request = { 
      :uuid => uuid, 
      :name => feature.elements['Title'].text, 
      :description => feature.elements['Abstract'].text
    }

    add_to_catalogue(catalogue_uri, request)
  end
end
