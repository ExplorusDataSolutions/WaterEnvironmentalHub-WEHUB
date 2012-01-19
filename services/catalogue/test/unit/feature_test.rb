require 'test_helper'

class FeatureTest < ActiveSupport::TestCase

  test "Instantiate FeatureMetaLayer from FeatureMetaContent" do
    result = FeatureMetaContent.create(:dataset_uuid => 'test', :source_uri => 'test/1', :layers_attributes => [{ :layer_id => '5', :source_uri => 'test/5' }])
    assert result
    assert result.dataset_uuid = 'test'
    assert result.layers
    assert result.layers[0].layer_id == '5'
  end 
 
  test "Verify creation of new FeatureMetaContent and FeatureMetaContentLayer through Feature" do
    source_uri = "http://wehub.geocens.ca:8183/wehub/service/#{random_integer}"    
    layer_id = random_integer
    feature_params = {
      :keywords => 'keywords, another-keyword',
      :source_uri => source_uri,
      :bounding_box => '23 -66,24 -125',
      :layers_attributes => [{
        :layer_id => layer_id,
        :source_uri => "http://wehub.geocens.ca:8183/wehub/service/6/#{layer_id}"
      }]
    }
    
    Feature.new(random_string, FeatureSource.new).create(feature_params)
    
    meta_content = FeatureMetaContent.find_by_source_uri(source_uri)
    
    assert meta_content
    assert meta_content.layers && meta_content.layers[0].layer_id == layer_id.to_s
  end
  
  test "Verify update of new FeatureMetaContent and FeatureMetaContentLayer through Feature" do
    source_uri = "http://wehub.geocens.ca:8183/wehub/service/#{random_integer}"
    layer_id = random_integer
    feature_params = {
      :dataset_uuid => random_string,
      :keywords => 'keywords, another-keyword',
      :source_uri => source_uri,
      :bounding_box => '23 -66,24 -125',
      :layers_attributes => [{
        :layer_id => layer_id,
        :source_uri => "http://wehub.geocens.ca:8183/wehub/service/6/#{layer_id}"
      }]
    }
    
    meta_content = FeatureMetaContent.new(feature_params)
    assert meta_content
    assert meta_content.save
    
    layer_id = layer_id + 100
    mutated_feature_params = {
      :keywords => 'keywords, another-keyword',

      :bounding_box => '23 -66,24 -125',
      :layers_attributes => [{
        :layer_id => layer_id,
        :source_uri => "http://wehub.geocens.ca:8183/wehub/service/6/#{layer_id}"
      }]
    }
    
    Feature.new(random_string, FeatureSource.new).create(mutated_feature_params)
    
    mutated_meta_content = FeatureMetaContent.find_by_source_uri(source_uri)
    assert mutated_meta_content.update_attributes(mutated_feature_params)
    assert mutated_meta_content
    assert mutated_meta_content.layers && mutated_meta_content.layers[0].layer_id == layer_id.to_s, "#{mutated_meta_content.layers[0].layer_id} != #{(layer_id)}"

#    meta_content.destroy
#    mutated_meta_content.destroy
  end
  
end
