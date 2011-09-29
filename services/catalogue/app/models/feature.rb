class Feature 
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming
  
  attr_accessor :uuid, :feature_source, :name, :feature_period
  
  def initialize(uuid, feature_source, name='', feature_period='')
    @uuid = uuid
    @feature_source = feature_source
    @name = name
    @feature_period = feature_period
  end
  
  def persisted?
    false
  end
  
  class << self
    def all
      return []
    end
  end
  
  def formats
    formats = ['JSON', 'Shape', 'XML', 'CSV']
    if is_data_source?('geoserver')
      formats.delete('CSV')
    elsif is_data_source?('catalogue')
    elsif is_data_source_external?
      formats.delete('Shape')
      formats.delete('CSV')
    end
    formats
  end
  
  def geoserver_translator
    if @geoserver_translator.nil?
      @geoserver_translator = GeoServerTranslator.new
    end
    @geoserver_translator
  end
  
  def data(advanced_search_params=nil)
    if is_data_source?('geoserver')
      geoserver_translator.data(uuid)
    elsif is_data_source?('catalogue')
      execute("SELECT * FROM #{tablename}")
    elsif is_data_source_external?
      begin
        ExternalServiceTranslator.new.data(uuid, advanced_search_params)
      rescue Exception => e
        raise ArgumentError, "external_service: #{e}"
      end
    else
      raise ArgumentError, "Data could not be retrieved for feature source of type #{feature_source.name}"
    end
  end
    
  def latitude_longitude
    if is_data_source?('geoserver')
      geoserver_translator.coordinates(uuid)
    elsif is_data_source?('catalogue')    
      latitude = ''
      longitude = ''

      begin
        first_row = execute("SELECT * FROM #{tablename} LIMIT 1")[0]

        if first_row
          geometry_column = first_row.select{ |column| column =~ /^the_geom|thepoint_lonlat/i }.first
          if geometry_column
            geometry_column = geometry_column[0]
            result = execute("SELECT x(st_centroid(st_extent(#{geometry_column}))), y(st_centroid(st_extent(#{geometry_column}))) FROM #{tablename}")
            if result
              result = result[0]
              latitude = result.select{ |column| column =~ /^y$/i }.first[1]
              longitude = result.select{ |column| column =~ /^x$/i }.first[1]
              if latitude.to_i.abs > 180
                latitude = longitude = ''
              end
            end
          end
          if latitude.empty? || longitude.empty?
            latitude = first_row.select{ |column| column =~ /^lat/i }.first[1]
            longitude = first_row.select{ |column| column =~ /^long/i }.first[1]
          end
        end

      rescue
      end

      !(latitude.empty? && longitude.empty?) ? "#{latitude},#{longitude}" : nil
    elsif is_data_source_external?
      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      if meta_content
        meta_content.coordinates
      end
    end
  end

  def bounding_box
    if is_data_source?('catalogue')
      begin
        first_row = execute("SELECT * FROM #{tablename} LIMIT 1")[0]

        if first_row
          geometry_column = first_row.select{ |column| column =~ /^the_geom|thepoint_lonlat/i }.first[0]
          if geometry_column
            postgis_box = execute("SELECT box2d(ST_extent(#{geometry_column})) FROM #{tablename}")[0].select{ |column| column =~ /box2d/ }.first[1].match(/BOX\((.*)\)/)
            if post_gis
              post_gis = postgis[1]
              { 
                :north => postgis_box.split(',')[1].split(' ')[1], 
                :east => postgis_box.split(',')[1].split(' ')[0],
                :south => postgis_box.split(' ')[1].split(',')[0],
                :west => postgis_box.split(' ')[0]
              }
            end
         end
        end
      rescue
      end
    elsif is_data_source_external?
      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      if meta_content && meta_content.bounding_box && !meta_content.bounding_box.empty?
        { 
          :north => meta_content.bounding_box.split(',')[1].split(' ')[1], 
          :east => meta_content.bounding_box.split(',')[1].split(' ')[0],
          :south => meta_content.bounding_box.split(' ')[1].split(',')[0],
          :west => meta_content.bounding_box.split(' ')[0]
        }
      end
    end
  end
  
  def temporal_extent
    if is_data_source?('catalogue') || is_data_source_external?
      TemporalExtentTranslator.new(feature_period).temporal_extent
    end
  end

  def create(params)
    
    if is_a_file?(params)
      tablename = "feature_data_#{uuid.gsub('-','_')}"
      if !params.match(/(\.xls|\.xlsx|\.ods.|\.csv)$/).nil?
        sheet_translator = SpreadsheetTranslator.new(params)
              
        execute("CREATE TABLE #{tablename} (#{sheet_translator.fields_sql})")
        execute(["COPY #{tablename} FROM ? WITH CSV", sheet_translator.filename])

        begin
          if !latitude_longitude.nil?

            lat_long_split = latitude_longitude.split(',')
            latitude = lat_long_split[0]
            longitude = lat_long_split[1]

            execute("SELECT addgeometrycolumn('public', '#{tablename}', 'the_geom' ,4326 ,'POINT' ,2);")
            execute("UPDATE public.#{tablename} SET the_geom = geometryfromtext('POINT(#{latitude} #{longitude})', 4326);")
          end
        rescue Exception => e
        end

      elsif !params.match(/(\.zip)$/).nil?
        shape_translator = ShapeTranslator.new(params, tablename)
            
        execute(shape_translator.shape_sql)
      else
        raise ArgumentError, "Feature could not be created from #{params}"
      end
    else
      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      
      meta_content_params = {:dataset_uuid => uuid, :keywords => params[:keywords], :source_uri => params[:source_uri], :bounding_box => params[:bounding_box]}
     
      if params[:bounding_box]
        centroid = "centroid('MULTIPOINT(#{params[:bounding_box]})')"
        result = execute("SELECT x(#{centroid}), y(#{centroid})")[0]
        if result
          latitude = result.select{ |column| column =~ /^y$/i }.first[1]
          longitude = result.select{ |column| column =~ /^x$/i }.first[1]
        end
        meta_content_params.store(:coordinates, "#{latitude},#{longitude}")
      end
       
      if meta_content.nil?
        meta_content = FeatureMetaContent.create(meta_content_params)
      else
        meta_content.attributes = meta_content_params
        meta_content.save
      end
    end
  end
  
  def keywords
    if is_data_source?('geoserver')
      observation_data = geoserver_translator.feature_fields(uuid)
      keywords = extract_keywords(observation_data)
    elsif is_data_source?('catalogue')
      observation_data = data_lightweight
      if observation_data[:data].count > 0
        keywords = extract_keywords(observation_data[:data][0])
      end
    elsif is_data_source_external?
      keywords = FeatureMetaContent.find_by_dataset_uuid(uuid).keywords.split(',')
    else 
      raise ArgumentError, "Keywords could not be retrieved for feature source of type #{feature_source.name}"
    end   
    
    if !keywords.nil?
      keywords = clean_id_fields(keywords)
      
      keywords.uniq + synonyms.uniq
    end
    
    keywords
  end
  
  def name
    @name
  end
    
  def filename
    name.scan(/\w+/).join('_').downcase
  end
  
  def tablename
    if is_data_source?('catalogue')
      resolve_tablename
    else
      raise ArgumentError, "Features of type base data don't have tables"
    end
  end
    
  def to_s
    puts "Feature:\n\t#{uuid}\n\t#{name}\n\t#{feature_source.to_s}"
  end

  def is_data_source?(params)
    feature_source.name == params
  end

  def is_data_source_external?
    is_data_source?('geocens') || is_data_source?('water_cloud')
  end
  private 

  def is_a_file?(params)
    params.is_a?(String)
  end
      
  def resolve_tablename
    tablename = nil
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil
      uuid_with_underscores = uuid.gsub(/-/, '_')      
      begin
        tablename = execute("SELECT tablename FROM pg_tables WHERE tablename LIKE '%#{uuid_with_underscores}%' LIMIT 1")[0]['tablename']
      rescue
        raise ArgumentError, "Observation data for #{uuid} could not be found"  
      end
    else
      raise ArgumentError, "Expected a valid uuid, but got #{uuid}"
    end
    tablename
  end

  def data_lightweight
    tablename = resolve_tablename
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      { :tablename => dataset_name, :data => execute("SELECT * FROM #{tablename} LIMIT 1") }
    end
  end
      
  def extract_keywords(observation_data)
    keywords = []
    
    observation_data.each do |k, v|
      if /\(/ =~ k
        if /(?<title_with_out_units>[\D]*)\(/ =~ k
          keywords.push(title_with_out_units.strip)
        end
        if /\((?<measurement_unit>.+)\)/ =~ k
          keywords.push(measurement_unit)
        end
      else
        keywords.push(k)
      end
    end

    keywords
  end
      
  def synonyms
    synonyms = []
  end
    
  def clean_id_fields(keywords)
    ['id','gid','nid'].each do |item|
      keywords.delete(item)
    end
    keywords.delete_if { |keyword| keyword.index('_id') }
    keywords.each_with_index do |keyword, index|
       keywords[index] = keyword.gsub('_',' ')
     end
    keywords
  end
  
  def execute(sql_params)
    if sql_params.kind_of?(Array)
      sql = ActiveRecord::Base.send(:sanitize_sql_array, sql_params)
    else
      sql = sql_params
    end
    ActiveRecord::Base.connection.execute(sql)
  end

end
