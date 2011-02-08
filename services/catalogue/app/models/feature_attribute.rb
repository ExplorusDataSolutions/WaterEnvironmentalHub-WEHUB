class FeatureAttribute < ActiveRecord::Base
  belongs_to :feature
  
  def as_json(options={})
    json = { :location => self.location, :name => self.name }
  end
  
end
