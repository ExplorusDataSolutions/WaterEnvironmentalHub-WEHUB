class Feature < ActiveRecord::Base
  
  belongs_to :dataset
  has_one :observation
  has_many :feature_attributes
  
end
