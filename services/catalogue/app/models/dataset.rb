class Dataset < ActiveRecord::Base
  
  has_one :dataset_group
  has_many :features
  
  scope :find_by_uuid, lambda {|uuid| { :conditions => { :uuid => uuid }}}
  
end
