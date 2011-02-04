class Feature < ActiveRecord::Base
  
  belongs_to :item
  has_one :observation
  has_many :feature_attributes
  
end
