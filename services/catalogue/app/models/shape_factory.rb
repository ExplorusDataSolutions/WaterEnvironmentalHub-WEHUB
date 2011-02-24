class ShapeFactory
  attr_accessor :working_directory
  
  def initialize(working_directory = "tmp/shapes/")
    @working_directory = working_directory
  end

  def find_by_id(id)    
    shapefiles = filenames(id)
    if !files_exist(shapefiles)
      build_files(id)
    end
    shapefiles
  end
  
  def data(filename)
    IO.read(path(filename))
  end

  private
    
  def path(id)
    "#{working_directory}/#{id}"
  end
  
  def files_exist(filenames)
    filenames.each do |file|
      if !File.exist?(path(file))
        return false
      end
    end
  end
  
  def build_files(id)    
    filename = path(id)

    config = Rails.configuration
    database = config.database_configuration[RAILS_ENV]["database"]
    username = config.database_configuration[RAILS_ENV]["username"]
    password = config.database_configuration[RAILS_ENV]["password"]
    
    begin
      # Building shape files using Postgis's pgsql2shp cmd
      result = %x[pgsql2shp -f #{filename} -u #{username} -P #{password} -r #{database} #{id}]
    rescue
      raise ArgumentError, "Shape files for #{uuid} could not be generated"
    end
  end
  
  def filenames(id)
    shapefiles = []
    ['dbf', 'shp', 'shx'].each do |extension|
      shapefiles.push("#{id}.#{extension}")
    end
    shapefiles
  end
  
end