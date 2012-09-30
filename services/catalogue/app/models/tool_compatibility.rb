class ToolCompatibility < ActiveRecord::Base

  def compatibilities
    eval(read_attribute(:compatibilities))
  end
  
end
