class Feature 

  include DatabaseHelper
  include FeatureHelper
  include GisHelper  
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
      @geoserver_translator = GeoServerTranslator.new(Rails.application.config.geoserver_address, 300, "#{Rails.root}/tmp/cache")
    end
    @geoserver_translator
  end
  
  def data(advanced_search_params=nil)
    filter_properties = filter_properties_from_params(advanced_search_params)

    if is_data_source?('geoserver')
      geoserver_translator.data(uuid, filter_properties)
    elsif is_data_source?('catalogue')
      result = execute("SELECT * FROM #{tablename} LIMIT 1")[0]
      if result
        has_geom = result.keys.include?('the_geom')
        column_names = result.keys & filter_properties if filter_properties && !filter_properties.empty?        
        column_names = result.keys if !column_names || column_names.empty?
        column_names.delete('the_geom')
        if has_geom
          column_names = column_names.collect {|x| "\"#{x}\"" }.join(', ')

          properties = execute("SELECT #{column_names} FROM #{tablename}")
          coordinates = execute("SELECT ST_AsGeoJSON(the_geom) AS geometry FROM #{tablename}")

          features = []
          properties.each_with_index do |prop, i|
            if coordinates[i]['geometry']
              features.push({ :type => "Feature",
                              :geometry => JSON.parse(coordinates[i]['geometry']),
                              :properties => properties[i]
                            })
            end
          end            
          
          # returning GeoJSON, for GeoJSON example see: http://geojson.org/geojson-spec.html#examples
          { :type => "FeatureCollection", :features => features }
        else
          column_names = column_names.collect {|x| "\"#{x}\"" }.join(', ')

          execute("SELECT #{column_names} FROM #{tablename}")
        end        
      end
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
     latitude_longitude_from_bbox(bounding_box)
    elsif is_data_source?('catalogue')    
      latitude = ''
      longitude = ''

      begin
        first_row = execute("SELECT * FROM #{tablename} LIMIT 1")[0]

        if first_row
          geometry_column = first_row.select{ |column| column =~ /^the_geom|thepoint_lonlat/i }.first
          if geometry_column
            geometry_column = geometry_column[0]
            result = execute("SELECT x(st_centroid(st_collect(#{geometry_column}))), y(st_centroid(st_collect(#{geometry_column}))) FROM #{tablename}")
            if result
              result = result[0]
              latitude = result.select{ |column| column =~ /^y$/i }.first[1]
              longitude = result.select{ |column| column =~ /^x$/i }.first[1]
              if latitude.to_i.abs > 90 || longitude.to_i.abs > 180 || latitude.to_i == 0 || longitude.to_i == 0
                latitude = longitude = ''
              end
              if (latitude.to_i < 0 && longitude.to_i < 0) || (latitude.to_i > 0  && longitude.to_i > 0)
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
      
      !(latitude.to_s == '' && longitude.to_s == '') ? "#{latitude},#{longitude}" : nil
    elsif is_data_source_external?
      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      if meta_content
        meta_content.coordinates
      end
    end
  end

  def bounding_box
    if is_data_source?('geoserver')
      geoserver_translator.bounding_box(uuid)
    elsif is_data_source?('catalogue')
      begin
        first_row = execute("SELECT * FROM #{tablename} LIMIT 1")[0]

        if first_row
          geometry_column = first_row.select{ |column| column =~ /^the_geom|thepoint_lonlat/i }.first[0]
          if geometry_column
            postgis_box = execute("SELECT box2d(st_extent(#{geometry_column})) FROM #{tablename}")[0].select{ |column| column =~ /box2d/ }.first[1].match(/BOX\((.*)\)/)
            if postgis_box
              postgis_box = postgis_box[1]
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
        bounding_box_from_string(meta_content.bounding_box)
      end
    end
  end
  
  def temporal_extent
    if is_data_source?('catalogue') || is_data_source_external?
      TemporalExtentTranslator.new(feature_period).temporal_extent
    end
  end

  def create(params)
    if params.key?(:filename)
      tablename = resolve_tablename
      filename = Pathname.new(params[:filename]).basename.to_s     
      directory = Pathname.new(params[:filename]).dirname.to_s

      if !filename.match(/(\.xls|\.xlsx|\.ods.|\.csv)$/).nil?
        sheet_translator = SpreadsheetTranslator.new(filename, directory, "#{Rails.root}/tmp/spreadsheets")
              
        execute("CREATE TABLE #{tablename} (#{sheet_translator.fields_sql})")
        execute(["COPY #{tablename} FROM ? WITH CSV", sheet_translator.filename])

        begin
          if !latitude_longitude.nil?

            lat_long_split = latitude_longitude.split(',')
            latitude = lat_long_split[0]
            longitude = lat_long_split[1]

            execute("SELECT addgeometrycolumn('public', '#{tablename}', 'the_geom' ,4326 ,'POINT' ,2);")
            execute("UPDATE public.#{tablename} SET the_geom = geometryfromtext('POINT(#{longitude} #{latitude})', 4326);")
          end
        rescue Exception => e
        end

      elsif !filename.match(/(\.zip)$/).nil?
        shape_translator = ShapeTranslator.new(filename, tablename, '4326', directory, "#{Rails.root}/tmp/shape_scripts")
            
        execute(shape_translator.shape_sql)
      else
        raise ArgumentError, "Feature could not be created from #{params}"
      end
    else
      meta_feature_params = params
      meta_feature_params.merge!(:dataset_uuid => uuid)
      meta_feature_params = coordinates_to_params_from_bounding_box(params)
      
      layers = meta_feature_params[:layers_attributes]
      if layers
        layers.each_with_index do |layer, i|
          layers[i] = coordinates_to_params_from_bounding_box(layer)
        end         
        meta_feature_params.merge!(:layers_attributes => layers)
      end      

      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      
      if meta_content.nil?
        meta_content = FeatureMetaContent.create(meta_feature_params)
      else
        meta_content.layers.destroy_all
        meta_content.update_attributes(meta_feature_params)
      end
    end
  end 
  
  def layers
    if is_data_source_external?
      meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)
      meta_content.layers unless !meta_content
    else
      Rails.logger.info "Layers could not be retrieved for feature #{uuid}, feature source of #{feature_source.name}"
      nil
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
      raise ArgumentError, "Keywords could not be retrieved for feature source of #{feature_source.name}"
    end   
    
    if !keywords.nil?
      keywords = clean_id_fields(keywords)
      
      keywords.uniq
    end
    
    keywords
  end
  
  def feature_fields
    fields = []
    fields_with_types = self.feature_fields_by_type
    fields_with_types.each { |key, value|  fields = fields + value } unless !fields_with_types
    fields
  end
  
  def feature_fields_by_type
    if is_data_source?('geoserver')
      geoserver_translator.feature_fields_by_type(uuid)
    elsif is_data_source?('catalogue')
      observation_data = data_lightweight      
      get_types(observation_data[:data][0]) unless !observation_data || observation_data[:data].count == 0
    else
      raise ArgumentError, "Feature field types could not be retrieved for feature with a feature source of #{feature_source.name}"      
    end
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
    
  def is_data_source?(params)
    feature_source.name == params
  end

  def is_data_source_external?
    is_data_source?('geocens') || is_data_source?('water_cloud') || is_data_source?('alberta_water_portal')
  end
  private 
      
  def resolve_tablename
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil
      "feature_data_#{uuid.gsub('-','_')}"
    else
      raise ArgumentError, "Expected a valid uuid, but got #{uuid}"
    end
  end

  def data_lightweight
    tablename = resolve_tablename
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      begin
        { :tablename => dataset_name, :data => execute("SELECT * FROM #{tablename} LIMIT 1") }
      rescue
        nil
      end
    end
  end

  def filter_properties_from_params(params)
    if params[:properties]
      result = params[:properties].split(',')
      if !result.is_a?(Array)
        result = [result]
      end
    end
    result
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
          
  def clean_id_fields(keywords)
    ['id','gid','nid','the_geom'].each do |item|
      keywords.delete(item)
    end
    keywords.delete_if { |keyword| keyword.index('_id') }
    keywords.each_with_index do |keyword, index|
       keywords[index] = keyword.gsub('_',' ')
     end
    keywords
  end
  
end
