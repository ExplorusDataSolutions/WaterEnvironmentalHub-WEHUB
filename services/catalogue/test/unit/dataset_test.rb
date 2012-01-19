require 'test_helper'

class DatasetTest < ActiveSupport::TestCase

#  include RandomHelper
  
  def dataset_params
    {
      :name => random_string,
      :description => random_string,
      :feature_type => FeatureType.new,
      :feature_source => FeatureSource.new,
      :creative_commons_license => CreativeCommonsLicense.new
    }
  end
  
  def owner_params(user_id)
    {
      :owner_attributes => { :user_id => user_id }
    }
  end

  def author_params(email)
    {
      :author_attributes => { :email => email }
    }
  end
    
  test "Instantiation of child objects" do
    result = Dataset.new(dataset_params)
    
    assert result
    assert result.feature_type
    assert result.feature_source
    assert result.creative_commons_license
  end
  
  test "Instantiation of Author through DataSet" do  
    email = random_string
    result = Dataset.new(dataset_params.merge!(author_params(email)))

    assert result
    assert result.author.email == email
  end

  test "Instantiation of Owner through DataSet" do
    user_id = random_integer
    result = Dataset.new(dataset_params.merge!(owner_params(user_id)))

    assert result
    assert result.owner.user_id == user_id
  end
  
  test "Update parent attributes" do
    new_desc = random_string
    result = Dataset.new(dataset_params)
    
    assert result && result.save
    assert result.update_attributes(:description => new_desc)
    assert result.description == new_desc
    assert Dataset.find_by_id(result.id).description == new_desc
    
    result.destroy
  end
  
end
