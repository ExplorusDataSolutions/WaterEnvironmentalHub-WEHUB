class ShapeBuilderGeoServer

  attr_accessor :shape_directory, :zip_directory, :server_address, :timeout
  
  def initialize(shape_directory, zip_directory='tmp/zips', server_address = '50.19.106.48:8080', timeout=300)
    @shape_directory = shape_directory
    @zip_directory = zip_directory
    @server_address = server_address
    @timeout = timeout
  end
  
  def build(feature)
    begin
      if !(File.exists? filename_and_path(feature))
        get_shape(feature)
      end
    rescue Exception => e
      raise ArgumentError, "Shape files for #{feature.name} could not be retrieved by GeoServer"
    end
    begin
      unzip_shape(feature)
    rescue Exception => e
      raise ArgumentError, "Shape files for #{feature.name} could not be unzipped by ShapeBuilderGeoServer"
    end
  end

  def file_extensions
    ['cst', 'dbf', 'prj', 'shp', 'shx']  
  end
  
  private 

  def get_shape(feature)
    response = http_get("GetFeature&typeName=#{feature.uuid}&maxFeatures=1&outputFormat=SHAPE-ZIP")

    open(filename_and_path(feature), 'wb') do |file|
      file.write(response)
    end
  end

  def filename_and_path(feature)
    "#{zip_directory}/#{feature.filename}.zip"
  end

  def unzip_shape(feature)
    Zip::ZipFile.open(filename_and_path(feature)) do |zip_file|
     zip_file.each do |file|       
       zip_file.extract(file, "#{shape_directory}/#{feature.filename}.#{filename_extension(file.name)}") { true }
     end
    end
  end
  
  def filename_extension(filename)
    filename.split('.')[1]
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