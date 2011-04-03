class ShapeTranslator
  
  def initialize(filename, tablename, srs='4326', uploads_directory='public/uploads', sql_directory='tmp/shape_scripts')
    @uploads_directory = uploads_directory
    
    @filename_sql = "#{path}/#{sql_directory}/#{tablename}.sql"
    
    filename_shape = unzip(upload_path(filename))
    
    result = %x[shp2pgsql -s 4326 "#{upload_path(filename_shape)}" "#{tablename}" > "#{@filename_sql}"]
  end
  
  def shape_sql
    sql = ''
    if File.zero?(@filename_sql)
      raise ArgumentError, "SQL script for #{@filename} could not be found"
    end
    File.open(@filename_sql, "r") do |file|
      while (row = file.gets)
        sql << row
      end
    end
    sql
  end

  private 
  
  def unzip(filename_upload)  
    filename_shape = ''
    has_dbf = false
    
    Zip::ZipFile.open(filename_upload) do |zip_file|
     zip_file.each do |file|
       
       if !file.name.match(/.shp$/).nil?       
         filename_shape = file.name
       end
       if !file.name.match(/.dbf$/).nil?
         has_dbf = true
       end
       zip_file.extract(file, upload_path(file.name)) { true }
     end
    end
    
    if !has_dbf
      raise ArgumentError, "Upload #{@filename} did not contain a .dbf file"
    end
    if filename_shape.empty?
      raise ArgumentError, "Upload #{@filename} did not contain a .shp file"
    end
    
    filename_shape
  end
      
  def upload_path(filename)
    "#{path}/#{@uploads_directory}/#{filename}"
  end
  
  def path
    if defined? RAILS_ROOT
      "#{RAILS_ROOT}"
    else
      File.realpath("../../")
    end
  end

end