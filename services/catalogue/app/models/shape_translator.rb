class ShapeTranslator
  
  def initialize(filename, tablename, source_srs='4326', uploads_directory='public/uploads', sql_directory='tmp/shape_scripts')
    @filename = filename
    @uploads_directory = uploads_directory
    @sql_directory = sql_directory
        
    @filename_sql = "#{@sql_directory}/#{tablename}.sql"
    
    filenames = unzip(upload_path(filename))
    ogr_filenames = to_ogr_filenames(filenames)
    source_srs_param = !(source_srs == '4326') ? "-s_srs \"EPSG:#{source_srs}\"" : ''

    result = %x[ogr2ogr -f "ESRI Shapefile" #{source_srs_param} -t_srs "EPSG:4326" "#{upload_path(ogr_filenames['shp'])}" "#{upload_path(filenames['shp'])}"]
    if $?.exitstatus == 127
      raise_error("Executable ogr2ogr could not be found")
    end

    result = %x[shp2pgsql -s '4326' "#{upload_path(ogr_filenames['shp'])}" "#{tablename}" > "#{@filename_sql}"]
    if $?.exitstatus == 127
      raise_error("Executable shp2pgsql could not be found")
    end
  end
  
  def shape_sql
    sql = ''
    if File.zero?(@filename_sql)
      raise_error("#{@filename} could not be loaded")
    end
    File.open(@filename_sql, "r") do |file|
      while (row = file.gets)
        sql << row
      end
    end
    sql
  end

  private 
  
  def to_ogr_filenames(filenames)
    ogr_filenames = {}
    filenames.each do |k, v|
      ogr_filenames.store(k, v.gsub(File.extname(v),"_ogr2ogr#{File.extname(v)}"))
    end
    ogr_filenames
  end
  
  def unzip(filename_upload)  
    result = {}

    Zip::ZipFile.open(filename_upload) do |zip_file|
      zip_file.each do |file|

        if !file.name.match(/.shp$/i).nil?       
          result.store('shp', file.name)
        end
        if !file.name.match(/.prj$/i).nil?
          result.store('prj', file.name)
        end
        if !file.name.match(/.dbf$/i).nil?
          result.store('dbf', file.name)
        end

        zip_file.extract(file, upload_path(file.name)) { true }
      end
    end
    
    if !result.key?('dbf')
      raise_error("#{@filename} does not contain a .dbf file")
    end
    if !result.key?('prj')
      raise_error("#{@filename} does not contain a .prj file")
    end    
    if !result.key?('shp')
      raise_error("#{@filename} does not contain a .shp file")
    end
    
    result
  end
  
  def raise_error(message)
    raise ArgumentError, "#{self.class.name}: #{message}"
  end
    
  def upload_path(filename)
    "#{@uploads_directory}/#{filename}"
  end
  
end
