class FeatureType < ActiveRecord::Base  
  scope :find_by_name, lambda {|name| { :conditions => { :name => name }}}
  
  def to_s
    puts "Feature type:\n\t#{name}"
  end
end
