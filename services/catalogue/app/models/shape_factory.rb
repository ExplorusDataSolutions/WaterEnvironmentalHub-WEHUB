require 'shape_builder_postgresql.rb'
require 'shape_builder_geoserver.rb'

class ShapeFactory
  attr_accessor :shape_directory, :feature
  
  def initialize(shape_directory = "tmp/shapes")
    @shape_directory = shape_directory
    @builders = {:base => ShapeBuilderGeoServer.new(shape_directory), :other => ShapeBuilderPostgreSQL.new(shape_directory)}
  end
  
  def find(feature)
    @feature = feature
    
    shapefiles = filenames
    
    if !files_exist(shapefiles)
      builder.build(feature)
    end
    
    shapefiles
  end

  private
  
  def builder
    if feature.is_base_data
      @builders[:base]
    else
      @builders[:other]
    end
  end
  
  def feature
    @feature
  end
      
  def files_exist(filenames)
    filenames.each do |filename|
      if !File.exist?("#{shape_directory}/#{filename}")
        return false
      end
    end
  end
      
  def filenames
    shapefiles = []
    
    builder.file_extensions.each do |extension|      
      shapefiles.push("#{feature.filename}.#{extension}")
    end
    
    shapefiles
  end
  
end