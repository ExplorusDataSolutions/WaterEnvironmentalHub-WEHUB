class Dataset < ActiveRecord::Base
  
  has_one :dataset_group
  has_many :features
  
  scope :find_by_uuid, lambda {|uuid| { :conditions => { :uuid => uuid }}}
  
  def as_json(options={})
    json = { 
      :dataset => { :uuid => self.uuid, :name => self.name, :description => self.description, :methodology => self.methodology}, 
      :group => self.dataset_group, 
      :features => self.features
    }
  end

end
