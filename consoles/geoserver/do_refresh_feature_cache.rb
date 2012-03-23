require 'net/http'
require 'active_support/core_ext'
require 'rexml/document'

server_address='http://10.84.107.230:8080/geoserver'

def http_get(uri)
  timeout = 5000
  url = URI.parse(uri)
  puts "Getting #{url}"
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  response = http.start {|http| http.get(url.to_s, { "Accept-Encoding" => "gzip", "User-Agent" => "gzip" }) }

  check_response(response)

  if response.header['Content-Encoding'].eql?( 'gzip' ) then
    gzip = Zlib::GzipReader.new(StringIO.new(response.body))
    gzip.read()
  else
    response.body
  end

end

def check_response(response)
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Success!"
  else
    response.error!
  end
end

xml_capabilities = http_get("#{server_address}/ows?service=wfs&version=1.1.0&request=GetCapabilities")
uuids = []
if xml_capabilities
  doc = REXML::Document.new(xml_capabilities)
  doc.elements.each('WFS_Capabilities/FeatureTypeList/FeatureType') do |feature|

    uuid = feature.elements['Name'].text
    if !uuid.scan(':').empty?
      uuid = uuid.split(':')[1]
      uuids.push(uuid) if uuid.length == 36 
    end

  end
end

puts "#{uuids.count} features to cache from geoserver"

max_features = 10000000
uuids.each do |uuid|
  time = Time.now
  puts "start #{time}"
  File.open("#{File.dirname(__FILE__)}/tmp/#{uuid}.csv", "w") { |f| f.write(http_get("#{server_address}/ows?service=WFS&version=2.0.0&request=GetFeature&typeName=#{uuid}&maxFeatures=#{max_features}&outputFormat=csv")) }
  puts "end #{Time.now - time}"
end

