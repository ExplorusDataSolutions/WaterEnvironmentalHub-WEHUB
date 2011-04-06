class FeatureType < ActiveRecord::Base  

  def to_s
    puts "Feature type:\n\t#{name}"
  end

end
