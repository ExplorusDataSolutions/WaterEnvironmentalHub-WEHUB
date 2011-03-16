require 'geoserver_translator.rb'

class Dataset < ActiveRecord::Base
  
  has_and_belongs_to_many :dataset_groups
  belongs_to :feature_type
  
  scope :find_by_uuid, lambda {|uuid| { :conditions => { :uuid => uuid }}}
  
  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid, :name => self.name, :description => self.description, :methodology => self.methodology }, 
      :group => self.dataset_groups.first.as_json(:exclude => self.uuid)
    }
  end
  
  def feature
    Feature.new(uuid, feature_type)
  end  
end
