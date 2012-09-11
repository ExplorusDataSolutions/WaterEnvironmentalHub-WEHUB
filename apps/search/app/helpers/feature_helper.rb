module FeatureHelper

  def selected_value(feature_fields_vocabulary, property_name, vocabulary_name)
    property_name = property_name.strip
    if feature_fields_vocabulary[property_name]
      if feature_fields_vocabulary[property_name][vocabulary_name]
        feature_fields_vocabulary[property_name][vocabulary_name][0]['id'].to_i
      end
    end
  end
    
  def selected_value_text_field(feature_fields_vocabulary, property_name, vocabulary_name)
    property_name = property_name.strip
    if feature_fields_vocabulary[property_name]
      if feature_fields_vocabulary[property_name][vocabulary_name]
        result = feature_fields_vocabulary[property_name][vocabulary_name]
        if result
          return "#{result[0].name}, #{result[0].description}"
        end
      end
    end
    ""
  end
  
  def vocabulary_params(params)  
    vocabulary_terms = nil
    if params.key?(:vocabulary)
      vocabulary_terms = []
      params[:vocabulary].each do |key, value|
        value.each do |inner_key, inner_value|
          vocabulary_terms.push({ 'term_id' => inner_value, 'term_source' => inner_key, :feature_field_position => key }) unless inner_value.empty?
        end
      end
    end
    
    vocabulary_terms
  end

end
