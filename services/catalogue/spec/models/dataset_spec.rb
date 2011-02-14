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

  it "can find by uuid"  do
    set1 = Factory(:dataset, :name => "set1", :uuid => "01572180-32e2-11e0-bc8e-0800200c9a66")
    set2 = Factory(:dataset, :name => "set2", :uuid => "0de453a0-32e2-11e0-bc8e-0800200c9a66")
    set3 = Factory(:dataset, :name => "set3", :uuid => "2245a730-32e3-11e0-bc8e-0800200c9a66")
    
    Dataset.all.should == [set1, set2, set3]
    
    Dataset.find_by_uuid("0de453a0-32e2-11e0-bc8e-0800200c9a66").should == [set2]
  end
  
end
