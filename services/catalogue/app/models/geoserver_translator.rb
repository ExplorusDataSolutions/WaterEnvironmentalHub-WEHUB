require 'net/http'
require 'active_support/core_ext'

class GeoServerTranslator
  attr_accessor :server_address, :timeout
  
  def initialize(server_address = '174.129.10.37:8080', timeout=300)
    @shape_directory = shape_directory
    @zip_directory = zip_directory
    @server_address = server_address
    @timeout = timeout
  end
    
  def feature_fields(uuid)
    fields = []
    hash = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=1&outputFormat=json"))
    hash = hash['features'][0]['properties']
    hash.each do |result|      
      fields.push(result[0])
    end
    
    fields
  end
      
  def http_get(uri)
    url = URI.parse("http://#{server_address}/geoserver/ows?service=WFS&version=1.0.0&request=#{uri}")    
    puts "Getting #{url}"
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout    
    response = http.start {|http| http.get(url.to_s) }
    
    check_response(response)
    
    response.body
  end
  
  def check_response(response)
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts "Success!"
    else
      response.error!  
    end
  end

end 