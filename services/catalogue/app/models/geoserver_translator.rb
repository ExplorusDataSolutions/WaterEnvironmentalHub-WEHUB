require 'net/http'
require 'active_support/core_ext'
require 'rexml/document'

class GeoServerTranslator
  attr_accessor :server_address, :timeout, :cache_directory
  
  def initialize(server_address='localhost:8080', timeout=300, cache_directory='tmp/cache')
    @server_address = server_address
    @timeout = timeout
  end

  def data(uuid, filter_properties=nil)
    data = []   
    
    url_properties = (filter_properties && !filter_properties.empty?) ? "&propertyName=#{filter_properties.join(',')}" : ''
    data = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=100000#{url_properties}&outputFormat=json"))
    
    data
  end
  
  def bounding_box(uuid)
    doc = REXML::Document.new(http_get("GetCapabilities"))
    doc.elements.each('WFS_Capabilities/FeatureTypeList/FeatureType') do |feature|

      element_uuid = feature.elements['Name'].text

      if !element_uuid.scan(':').empty?
        element_uuid = element_uuid.split(':')[1] 
      end

      if element_uuid && element_uuid == uuid
        bbox = feature.elements['LatLongBoundingBox']
        return { 
          :north => bbox.attributes['maxy'],
          :east => bbox.attributes['maxx'],
          :south => bbox.attributes['miny'],
          :west => bbox.attributes['minx'],
        }
      end  

    end
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
  
  def get_type(string)
    type = :string
    begin
      Float(string)
      type = :numeric
    rescue
    end
    type
  end
  
  def feature_fields_by_type(uuid)
    fields_with_types = {}
    
    hash = get_features(uuid)
    hash = hash['features'][0]['properties']
    hash.each do |result|
      if fields_with_types[get_type(result[1])].nil? 
        fields_with_types[get_type(result[1])] = []
      end
      fields_with_types[get_type(result[1])].push(result[0])
    end
    
    fields_with_types
  end
    
  def get_features(uuid)
    if @features.nil?
      @features = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=1&outputFormat=json"))
    end
    @features
  end
          
  def http_get(uri)
    url = URI.parse("#{server_address}/geoserver/ows?service=WFS&version=1.0.0&request=#{uri}")    
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
