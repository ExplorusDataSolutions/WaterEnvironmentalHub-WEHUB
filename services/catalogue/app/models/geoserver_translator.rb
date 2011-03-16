require 'rexml/document'
require 'net/http'
require 'json'
require 'active_support/core_ext'
require 'zip/zip'

class GeoServerTranslator
  attr_accessor :shape_directory, :zip_directory, :server_address, :timeout
  
  @@cached_names = {}
  
  def initialize(shape_directory='tmp/shapes', zip_directory='tmp/zips', server_address = '174.129.10.37:8080', timeout=300)
    @shape_directory = shape_directory
    @zip_directory = zip_directory
    @server_address = server_address
    @timeout = timeout
  end
  
  def cached_names
    @@cached_names
  end
  
  def get_shape(uuid)  
    response = http_get("GetFeature&typeName=#{uuid}&maxFeatures=1&outputFormat=SHAPE-ZIP")

    open("#{zip_directory}/#{filename(uuid)}", 'wb') do |file|
      file.write(response)
    end
  end
  
  def unzip_shape(uuid)
    puts filename(uuid)

    Zip::ZipFile.open("#{zip_directory}/#{filename(uuid)}") do |zip_file|
     zip_file.each do |file|       
       zip_file.extract(file, "#{shape_directory}/#{filename(uuid, filename_extension(file.name))}") { true }
     end
    end
  end

  def feature_type_fields(uuid)
    fields = []
    hash = JSON.parse(http_get("GetFeature&typeName=#{uuid}&maxFeatures=1&outputFormat=json"))
    hash = hash['features'][0]['properties']
    hash.each do |result|      
      fields.push(result[0])
    end
    
    fields
  end
    
  private
  
  def filename(uuid, extension='zip')
    "#{hyphen_to_underscore(shape_name(uuid).gsub(' ','_'))}_#{hyphen_to_underscore(uuid)}.#{extension}".downcase
  end
  
  def hyphen_to_underscore(value)  
    value.gsub('-','_')
  end
  
  def filename_extension(filename)
    filename.split('.')[1]
  end  
  
  def shape_name(uuid)
    if cached_names.has_key?(uuid)
      name = cached_names.fetch(uuid)
    else
      name = ''
      
      response = http_get("GetCapabilities")
      doc = REXML::Document.new(response)
      
      doc.elements.each('WFS_Capabilities/FeatureTypeList/FeatureType') do |item|
        if item.elements['Name'].text.index(uuid) != nil
          name = item.elements['Title'].text
        end
      end

      cached_names.store(uuid, name)
    end
    
    name
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

test = GeoServerTranslator.new()
test.get_shape('1d7f9c90-3f79-11e0-9207-0800200c9a66')
test.unzip_shape('1d7f9c90-3f79-11e0-9207-0800200c9a66')
