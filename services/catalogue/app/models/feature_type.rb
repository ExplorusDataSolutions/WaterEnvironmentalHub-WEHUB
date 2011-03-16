class FeatureType < ActiveRecord::Base  
  scope :find_by_name, lambda {|name| { :conditions => { :name => name }}}
end
