require 'spec_helper'

describe DatasetGroup do
  
  it "has a dataset relationship" do    
    group = Factory(:dataset_group)
    group.datasets.should_not be_nil
    group.datasets.first.should be_kind_of(Dataset)
  end
  
end
