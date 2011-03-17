
class Feature < ActiveRecord::Base
  attr_accessor :uuid, :feature_type
  
  def initialize(uuid, feature_type)
    @feature_type = feature_type
    @uuid = uuid
  end
  
  def self.data(uuid)
    tablename = self.find_observation_id(uuid)
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      { :tablename => dataset_name, :data => self.connection.execute("SELECT * FROM #{tablename}") }
    end
  end
  
  def keywords(uuid)
    if is_base_data
      observation_data = GeoServerTranslator.new.feature_fields(uuid)
      keywords = extract_keywords(observation_data)
    else
      observation_data = data_lightweight(uuid)
      if observation_data[:data].count > 0
        keywords = extract_keywords(observation_data[:data][0])
      end
    end   
    
    keywords = clean_id_fields(keywords)
    
    keywords.uniq + synonyms.uniq
  end
  
  def find_observation_id(uuid)
    tablename = nil
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil
      uuid = uuid.gsub(/-/, '_')      
      tablename = tablename(uuid)
    else
      raise ArgumentError, "Expected a valid uuid, but got #{uuid}"
    end
    tablename
  end

  
  private 
  
  def data_lightweight(uuid)
    tablename = find_observation_id(uuid)
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      { :tablename => dataset_name, :data => self.connection.execute("SELECT * FROM #{tablename} LIMIT 1") }
    end
  end
  
  def tablename(uuid)    
    begin
      tablename = self.connection.execute("SELECT tablename FROM pg_tables WHERE tablename LIKE '%#{uuid}%'")[0]['tablename']
    rescue
      raise ArgumentError, "Observation data for #{uuid} could not be found"  
    end
  
    tablename
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
  
  def is_base_data()
    feature_type.name.downcase.index('base') != nil
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

end