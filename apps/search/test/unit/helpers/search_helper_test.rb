require 'test_helper'

class SearchHelperTest < ActionView::TestCase

  test "param default should return true" do
    params = { :keywords => 'search by keyword' }
    assert param_default(params[:keywords], 'search by keyword')
  end

  test "param default should not return false" do
    params = { :keywords => 'datasetname' }
    assert !param_default(params[:keywords], 'search by keyword')
  end
  
end

