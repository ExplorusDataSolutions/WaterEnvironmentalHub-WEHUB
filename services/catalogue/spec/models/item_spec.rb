require 'spec_helper'

describe Item do
  
  it "has an item group relationship" do
    item = Factory(:item_fully_loaded)

    item.item_group.should_not be_nil
    item.item_group.should be_kind_of(ItemGroup)
  end
  
  it "has a feature relationship" do
    item = Factory(:item_fully_loaded)

    item.features.should_not be_nil
    item.features.count.should > 1
    item.features[0].should be_kind_of(Feature)
  end  
  
end
