require 'spec_helper'

describe ItemGroup do
  
  it "has an item relationship" do    
    item_group = Factory(:item_group)  
    item_group.item.should_not be_nil    
    item_group.item.should be_kind_of(Item)
  end
  
end
