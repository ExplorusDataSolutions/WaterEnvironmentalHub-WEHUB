class ToolCompatibility < ActiveRecord::Base

  def compatibilities
    result = read_attribute(:compatibilities)
    
    result.is_a?(Array) ? result : eval(result)
  end
  
end
