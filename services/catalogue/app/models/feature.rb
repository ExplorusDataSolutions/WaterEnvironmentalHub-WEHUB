class Feature < ActiveRecord::Base
  
  belongs_to :dataset
  has_one :observation
  has_many :feature_attributes
  
  def as_json(options={})
    json = { 
      :feature => { :location => self.location, :name => self.name }, 
      :observations => self.observation,
      :attributes => self.feature_attributes
    }
  end

end
