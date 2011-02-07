require 'spec_helper'

describe Dataset do
  
  it "has an dataset group relationship" do
    dataset = Factory(:dataset_fully_loaded)

    dataset.dataset_group.should_not be_nil
    dataset.dataset_group.should be_kind_of(DatasetGroup)
  end
  
  it "has a feature relationship" do
    dataset = Factory(:dataset_fully_loaded)

    dataset.features.should_not be_nil
    dataset.features.count.should > 1
    dataset.features[0].should be_kind_of(Feature)
  end  
  
end
