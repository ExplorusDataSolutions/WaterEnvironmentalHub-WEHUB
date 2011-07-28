require 'net/http'
require 'active_support/core_ext'

class GeoServerTranslator
  attr_accessor :server_address, :timeout, :cache_directory
  
  def initialize(server_address = '50.19.106.48:8080', timeout=300, cache_directory='tmp/cache')
    @server_address = server_address
    @timeout = timeout
    @cache_directory = cache_directory
  end

  def data(uuid)
    data = []
    if !(File.exists? cache_filename(uuid))
      data = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=10000&outputFormat=json"))
      begin
        File.open(cache_filename(uuid), 'w') { |f| f.write(data) }
      rescue
      end
    else
      File.open(cache_filename(uuid), 'r') { |f| data = eval(f.read) }
    end
    data
  end
  
  def coordinates(uuid)
    hash = get_features(uuid)
    coords = hash['features'][0]['geometry']['coordinates'].join(',').split(',')
    "#{coords[0]},#{coords[1]}"
  end
    
  def feature_fields(uuid)
    fields = []
    hash = get_features(uuid)
    hash = hash['features'][0]['properties']
    hash.each do |result|      
      fields.push(result[0])
    end
    
    fields
  end
  
  def cache_filename(uuid)
    "#{cache_directory}/geoserver_#{uuid.gsub('-','_')}.json"
  end
  
  def get_features(uuid)
    if @features.nil?
      @features = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=1&outputFormat=json"))
    end
    @features
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