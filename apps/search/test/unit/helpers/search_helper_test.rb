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
  
  test "nil param should return false" do
    assert !param_provided(nil)
  end

  test "empty param should return false" do
    assert !param_provided('')
  end

  test "some param should return true" do
    assert param_provided('some param')
  end
  
end

