class Feature < ActiveRecord::Base
  
  belongs_to :dataset
  has_one :feature_type
  has_many :feature_attributes
  
  def as_json(options={})
    json = { 
      :feature => { :name => self.name, :description => self.description }, 
      :attributes => self.feature_attributes
    }
  end

end
