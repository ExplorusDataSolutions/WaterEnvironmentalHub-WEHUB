require 'test_helper'

class FeatureCacheTest < ActiveSupport::TestCase

  test "geojson returned from csv" do
    feature_cache = FeatureCache.new("#{File.dirname(__FILE__)}/data")
    response = feature_cache.data('json', 'c7d1d2f0-3f77-11e0-9207-0800200c9a66')
    puts response if !response.nil?
    assert response && !response.nil?
    assert response == '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"gid":"1","geobase_id":"-1","validity_d":"1977","acquisitio":"0","dataset_na":"082O01","planimetri":"43","provider":"2","completely":"1","bdg_id":"11CF458460DFE5F4E0409C8467120387","mep_id":"171466","qualif_rep":"1","code_spec":"2270012","cd_elem_to":"2270002","shape_leng":"0.01080909","feature_ty":"Urban Parks","shape_le_1":"0.01080909","shape_area":"0.00000502"}},{"type":"Feature","properties":{"gid":"2","geobase_id":"-1","validity_d":"1969","acquisitio":"0","dataset_na":"082H05","planimetri":"23","provider":"2","completely":"1","bdg_id":"d0df96b529a0492c8e8b198962831318","mep_id":"211594","qualif_rep":"1","code_spec":"2270012","cd_elem_to":"2270002","shape_leng":"0.00573755","feature_ty":"Urban Parks","shape_le_1":"0.00573755","shape_area":"0.00000171"}}]}'
  end

  test "geojson returned from csv with two properties being filtered" do
    feature_cache = FeatureCache.new("#{File.dirname(__FILE__)}/data")
    response = feature_cache.data('json', 'c7d1d2f0-3f77-11e0-9207-0800200c9a66', 'gid,shape_area',)
    puts response if !response.nil?
    assert response && !response.nil?
    assert response == '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"gid":"1","shape_area":"0.00000502"}},{"type":"Feature","properties":{"gid":"2","shape_area":"0.00000171"}}]}'
  end

  test "geojson returned from csv with one properties being filtered" do
    feature_cache = FeatureCache.new("#{File.dirname(__FILE__)}/data")
    response = feature_cache.data('json', 'c7d1d2f0-3f77-11e0-9207-0800200c9a66', 'shape_area',)
    puts response if !response.nil?
    assert response && !response.nil?
    assert response == '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"shape_area":"0.00000502"}},{"type":"Feature","properties":{"shape_area":"0.00000171"}}]}'
  end
  
end
