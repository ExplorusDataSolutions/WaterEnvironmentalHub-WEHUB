class Item < ActiveRecord::Base
  
  has_one :item_group
  has_many :features
  
end
