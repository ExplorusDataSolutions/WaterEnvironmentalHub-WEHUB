require 'spec_helper'

describe DatasetGroup do
  
  it "has an dataset relationship" do    
    group = Factory(:dataset_group)  
    group.dataset.should_not be_nil    
    group.dataset.should be_kind_of(Dataset)
  end
  
end
