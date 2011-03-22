class FeatureFormatFactory
  attr_accessor :feature_type, :feature
  
  def find(feature_type, feature)
    @feature = feature
    @feature_type = feature_type
    
    data = feature.data

    case feature_type 
    when 'json'
      data = data.to_json
    when 'xml'
      data = data.to_xml
    else
      raise ArgumentError, "Feature type of #{feature_type} is not implemented"
    end

    { :filename => "#{feature.filename}.#{feature_type}", :data => data }
  end
  
end
