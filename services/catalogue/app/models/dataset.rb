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
  
  def self.find_observation_id(uuid)
    tablename = nil
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil
      uuid = uuid.gsub(/-/, '_')
      
      begin
        tablename = self.connection.execute("SELECT tablename FROM pg_tables WHERE tablename LIKE '%#{uuid}%'")[0]['tablename']
      rescue
        raise ArgumentError, "Observation data for #{uuid} could not be found"  
      end

      tablename
    else
      raise ArgumentError, "Expected a valid uuid, but got #{uuid}"
    end
    tablename
  end
end
