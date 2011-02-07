class Dataset < ActiveRecord::Base
  
  has_one :dataset_group
  has_many :features
  
end
