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

  def self.download(uuid)    
    if uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) != nil    
      uuid = uuid.gsub(/-/, '_')
    
      tablename = self.connection.execute("SELECT tablename FROM pg_tables WHERE tablename LIKE '%#{uuid}%'")[0]['tablename']            
      self.connection.execute("SELECT * FROM #{tablename}")
    end
  end
end
