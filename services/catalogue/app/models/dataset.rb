class Dataset < ActiveRecord::Base
  
  has_and_belongs_to_many :dataset_groups
  has_many :features
  
  scope :find_by_uuid, lambda {|uuid| { :conditions => { :uuid => uuid }}}

  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid, :name => self.name, :description => self.description, :methodology => self.methodology }, 
      :group => self.dataset_groups.first.as_json(:exclude => self.uuid)
    }
  end

  def self.data(uuid)
    tablename = self.find_observation_id(uuid)
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      { :tablename => dataset_name, :data => self.connection.execute("SELECT * FROM #{tablename}") }
    end
  end
  
  def self.data_lightweight(uuid)
    tablename = self.find_observation_id(uuid)
    if tablename != nil          
      dataset_name = tablename.gsub("_#{uuid}", '')
      
      { :tablename => dataset_name, :data => self.connection.execute("SELECT * FROM #{tablename} LIMIT 1") }
    end
  end
  
  def self.tablename(uuid)    
    begin
      tablename = self.connection.execute("SELECT tablename FROM pg_tables WHERE tablename LIKE '%#{uuid}%'")[0]['tablename']
    rescue
      raise ArgumentError, "Observation data for #{uuid} could not be found"  
    end
  
    tablename
  end
  
  def self.find_observation_id(uuid)
    tablename = nil
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil
      uuid = uuid.gsub(/-/, '_')
      
      tablename = self.tablename(uuid)
    else
      raise ArgumentError, "Expected a valid uuid, but got #{uuid}"
    end
    tablename
  end
  
  def self.keywords(uuid)
    keywords = []

    observation_data = self.data_lightweight(uuid)
    
    if observation_data[:data].count > 0
      observation_data[:data][0].each do |k, v|
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
      
      keywords = remove_id_fields(keywords)
    end    
    
    keywords.uniq + self.synonyms.uniq
  end
    
  def self.synonyms
    synonyms = []
  end
  
  def self.remove_id_fields(keywords)
    keywords.delete('id')
    keywords.delete_if { |keyword| keyword.index('_id') }
  end 
  
  def self.is_base(uuid)
    self.find_observation_id(uuid).match(/nrn_|hyd_|cvec_/) != nil
  end
end
