class FeatureAttribute < ActiveRecord::Base
  belongs_to :feature
  
  def self.unit
    self.name
  end
  
  def as_json(options={})
    json = { :name => self.name, :unit => self.unit }
  end
  
end
