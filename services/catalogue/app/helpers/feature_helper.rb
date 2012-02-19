module FeatureHelper

  def get_type(string)
    type = :string
    begin
      Float(string)
      type = :numeric
    rescue
    end
    type
  end

  def get_types(hash)
    fields_with_types = {}

    hash.each do |result|
      if fields_with_types[get_type(result[1])].nil? 
        fields_with_types[get_type(result[1])] = []
      end
      fields_with_types[get_type(result[1])].push(result[0])
    end
    
    fields_with_types
  end
  
end
