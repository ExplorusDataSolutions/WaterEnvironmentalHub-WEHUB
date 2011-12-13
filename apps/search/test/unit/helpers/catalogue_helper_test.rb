require 'test_helper'
require 'csv'

class CatalogueHelperTest < ActionView::TestCase
  
  def dataset_names
    names = []
    CSV.foreach(File.expand_path('test/unit/data/dataset_names.csv')) do |row|
      name = row[0]
      if !name.nil?
        names.push(name)
      end
    end    
    names
  end

=begin
  test "should display groups" do
   groups = clean_groups(find_groups(dataset_names))
   
   groups.each { |g| puts g } 
  end
=end
  
  test "group_should_not_contain_U" do
    names = [ "U. S. Fish and Wildlife Service - National Wetlands Inventory for Montana", 
              "U.Geological Survey- LANDSAT Index WRS-1",
              "U.S. Geological Survey - Montana Names from the Geographic Names Information System - Peaks",
              "U.S. Geological Survey - Volcanoes",
              "U.Geological Survey- LANDSAT Index WRS-2",
              "U.Bureau of Mines Mineral Location Database",
              "U S Geological Survey - Montana Airports",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Cities",
              "U.S. Dams",
              "U.S. National Park Service - Wetlands and Deepwater Habitats of the Conterminous United States",
              "U.S. Geological Survey - Geographic Names Information System (GNIS)",
              "U.S. Geological Survey - Montana Names from the Geographic Names Information System - High Peaks",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Detailed County Boundaries",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Lakes",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Neighboring States",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma River Systems",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Deatailed Boundary",
              "U.S. Bureau of the Census (BOC) - State of Oklahoma Township and Range",
              "US Census - State of Oklahoma Highway System",
              "U.Coalbed Methane Field Boundaries"]

    groups = find_groups(names)
    groups = clean_groups(groups)
    
    assert groups
    assert !(groups.nil? || groups.empty?)
    assert groups.index('U').nil?
    assert !groups.index("U.S. Bureau of the Census (BOC)").nil?
    assert !groups.index("U.S.").nil?
  end


  test "group should not contain 1" do
    names = ["1:2 000 000-Scale Hydrologic Unit Boundaries (Line)", "1:2 000 000-Scale Hydrologic Unit Boundaries (Polygon)"]
    
    groups = clean_groups(find_groups(names))
    
    assert groups    
    assert groups && groups.empty?
    assert groups.index("1").nil?
  end

  test "should group birds name with hyphen and bracket" do

    names = [ "Birds of the Western Hemisphere - Furnariidae (Polygon 13 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 14 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 15 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 16 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Point 1 of 1)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 1 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 2 of 16)",
              "Birds of the Western Hemisphere - Furnariidae (Polygon 3 of 16)"
            ]
    
    groups = find_groups(names)
    
    assert groups    
    assert groups.count > 0
    assert groups[0] == 'Birds of the Western Hemisphere'
  end


  test "should group burea of land management" do
    names = [ "Bureau of Land Management - Casper Field Office Fires (1990 Polygon)",
              "Bureau of Land Management - Casper Field Office Fires (1990 Point)",
              "Bureau of Land Management - Casper Field Office Fires (1991 Polygon)",
              "Bureau of Land Management - Casper Field Office Fires (1991 Point)",
              "Bureau of Land Management - Casper Field Office Fires (1992 Polygon)"
            ]
    groups = find_groups(names)

    assert groups    
    assert groups.count > 0    
    assert groups[0] == 'Bureau of Land Management'
  end


  test "should group circum" do
    names = [ "Circum-Arctic Map of Permafrost and Ground-Ice Conditions (PermaIce)",
              "Circum-Arctic Map of Permafrost and Ground-Ice Conditions (SubSea)",
              "Circum-Arctic Map of Permafrost and Ground-Ice Conditions (Treeline)"
            ]
    groups =  find_groups(names)
    
    assert groups
    assert groups.count > 0
    assert groups[0] == 'Circum-Arctic Map of Permafrost and Ground-Ice Conditions'
  end  

  test "should group circum with hypen delimiter" do
    names = [ "Circum-Arctic Map of Permafrost and Ground-Ice Conditions - test 1 (PermaIce)",
              "Circum-Arctic Map of Permafrost and Ground-Ice Conditions - test 2 (SubSea)",
              "Circum-Arctic Map of Permafrost and Ground-Ice Conditions - test 3(Treeline)"
            ]
    groups =  find_groups(names)

    assert groups    
    assert groups.count > 0    
    assert groups[0] == 'Circum-Arctic Map of Permafrost and Ground-Ice Conditions'
  end  

  test "verify has hypen as delimiter false" do
    assert !has_hyphen_as_delimiter("Circum-Arctic Map of Permafrost and Ground-Ice Conditions (PermaIce)")
  end

  test "verify has hypen as delimiter true" do
    assert has_hyphen_as_delimiter("Circum-Arctic Map of Permafrost and Ground-Ice Conditions - (PermaIce)")
  end
  
  test "verify bracket_is_before_hyphen true" do 
    assert bracket_is_before_hyphen(' ( - ')
  end
  
  test "should group ABMI with brackets" do
    names = [ "ABMI (Alberta Biodiversity Monitoring Institute)- T13 % Cover Low Vegetation Species",
              "ABMI (Alberta Biodiversity Monitoring Institute)- T13 % Cover Low Vegetation Species",
              "ABMI (Alberta Biodiversity Monitoring Institute)- W03C Human Caused Site Disturbance",
              "ABMI (Alberta Biodiversity Monitoring Institute)- W05 Vascular Plants",
              "ABMI (Alberta Biodiversity Monitoring Institute)- W06 Aquatic Invertebrates Collection"
            ]
    groups = find_groups(names)

    assert groups    
    assert !groups.index("ABMI (Alberta Biodiversity Monitoring Institute)").nil?          
  end
  
  test "should group National Hydro Network with numbers as delimiter"do 
    names = [ "National Hydro Network 07 AB Obstacle Polygon",
              "National Hydro Network 07 AB SLWater",
              "National Hydro Network 08 AB Bank",
              "National Hydro Network 08 AB Hydrojuction"
            ]
    groups = find_groups(names)

    assert groups    
    assert !groups.index("National Hydro Network").nil?  
  end
  
  test "should group Canvec Base Data" do
    names = [ "CanVec Base Data Alberta Parks",
              "CanVec Base Data Alberta WaterBodies",
              "CanVec Base Data Alberta Watercourse",
              "CanVec Base Data Alberta Wetlands Alberta",
              "CanVec Base Data Province Boundaries"
            ]
            
    groups = find_groups(names)

    assert groups    
    assert !groups.index("CanVec Base Data Alberta").nil?
    assert !groups.index("CanVec Base Data").nil?
  end
  
  test "should group names with commas like City of North Vancouver, BC" do
    names = [ "City of North Vancouver, BC - Creeks",
              "City of North Vancouver, BC - Debris Fans",
              "City of North Vancouver, BC - Developed Areas",
              "City of North Vancouver, BC - Fire Sprinkler Areas",
              "City of North Vancouver, BC - Irrigation Systems"
            ]
    groups = find_groups(names)

    assert groups    
    assert !groups.index("City of North Vancouver, BC").nil?
  end
  
  test "should group names with apostrophes like Canada's Forest Inventory" do
    names = [ "Canada's Forest Inventory (CanFI) 2001 for the boreal eco-region - percent forested, Manitoba",
              "Canada's Forest Inventory (CanFI) 2001 for the boreal eco-region - percent forested, Saskatchewan",
              "Canada's Forest Inventory (CanFI) 2001 for the boreal eco-region - Percent forested, British Columbia"
            ]
    groups = find_groups(names)

    assert groups
    assert !groups.index("Canada's Forest Inventory (CanFI) 2001 for the boreal eco-region").nil?
  end
  
  test "should group Mammals" do
    names = [ "Mammals of the Western Hemisphere - Pitheciidae (Point 1 of 1)",
              "Mammals of the Western Hemisphere - Cebidae (Point 1 of 1)",
              "Mammals of the Western Hemisphere - Caluromyidae (Point 1 of 1)",
              "Mammals of the Western Hemisphere - Caluromyidae (Polygon 1 of 1)",
              "Mammals of the Western Hemisphere - Camelidae (Polygon 1 of 1)",
              "Mammals of the Western Hemisphere - Canidae (Polygon 1 of 1)"
           ]
    groups = find_groups(names)

    assert groups    
    assert !groups.index("Mammals of the Western Hemisphere").nil?
  end
  
  test "should group Monthly Sea Ice" do
    names = [ "Monthly Sea Ice Index (North Polygon - 1980)",
              "Monthly Sea Ice Index (North Line - 1980)",
              "Monthly Sea Ice Index (North Polygon - 1981)",
              "Monthly Sea Ice Index (North Line - 1981)",
              "Monthly Sea Ice Index (North Polygon - 1982)",
              "Monthly Sea Ice Index (North Line - 1982)",
              "Monthly Sea Ice Index (North Polygon - 1983)"
            ]
    groups = find_groups(names)

    assert groups    
    assert !groups.index("Monthly Sea Ice Index").nil?
  end

  test "should group names with slash like Waters with N/P" do
    names = [ "Waters with N/P TMDLs (Polygon)",
              "Waters with N/P TMDLs (Line)"
            ]
    groups = find_groups(names)
    
    assert groups
    assert !groups.index("Waters with N/P TMDLs").nil?
  end

  test "should remove incomplete names like City of" do
    names = [ "City of",
              "City of Edmonton",
              "City of Edmonton",              
              "City of North Vancouver",
              "City of Ottawa",
              "City of Ottawa",              
              "City of Spokane",
              "City of Toronto"
            ]
    groups = clean_groups(find_groups(names))
    
    assert groups
    assert !groups.index("City").nil?
    assert !groups.index("City of Edmonton").nil?
  end

  test "should remove incomplete names" do
    names = [ "City of",
              "Alberta and",
              "NARS N/P Values for",
              "Incomplete description the",
              "Wetland",
              "GeoBC Database:"
            ]
    groups = clean_groups(names)
    
    assert groups
    assert !groups.index("City").nil?
    assert !groups.index("Alberta").nil?
    assert !groups.index("NARS N/P Values").nil?
    assert !groups.index("Incomplete description").nil?
    assert !groups.index("Wetland").nil?
    assert !groups.index("GeoBC Database").nil?    
  end
  
  test "should remove names shorter than two characters" do
    names = [ "AB", "U.", "US", "U.S." ]
    
    groups = clean_groups(names)

    assert groups
    assert groups.count == 1
    assert !groups.index("U.S.").nil?
  end

  test "should order groups properly and test case insensitivity for City of" do
    groups = [ "City", "City of Edmonton", "City of Ottawa" ]
    items = [   to_mash({ :name => "City of Edmonton", :uuid => 1 }), 
                to_mash({ :name => "City of Toronto", :uuid => 2 }), 
                to_mash({ :name => "City of edmonton", :uuid => 3 }), 
                to_mash({ :name => "City of toRONTO", :uuid => 4 }) 
            ]
    
    results = group(items, groups)
    
    assert results
    assert results['City'] && results['City'].count == 2
    assert results['City'][0] && !results['City'][0].name.index(/toronto/i).nil?
    assert results['City of Edmonton'] && results['City of Edmonton'].count == 2
    assert results['non_grouped'] && results['non_grouped'].count == 0
  end
  
  test "should not have groups containing one item" do
    groups = ["Lower"]
    items = [ to_mash({ :name => "Lower Peace Region Potential Conservation Areas", :uuid => 1}) ]

    results = group(items, groups)
    
    assert results
    assert results['non_grouped'] && results['non_grouped'].count == 1
  end
  

  test "should have sorted items" do
    groups = ["Metro Vancouver"]
    items = [   to_mash({ :name => "Metro Vancouver - Frog", :uuid => 1 }), 
                to_mash({ :name => "Metro Vancouver - Zebra", :uuid => 2 }), 
                to_mash({ :name => "Metro Vancouver - Ant", :uuid => 3 }),
            ]

    results = group(items, groups)
 
    assert results
    assert results['Metro Vancouver'] && results['Metro Vancouver'].count == 3
    assert results['Metro Vancouver'][0].name == "Metro Vancouver - Ant"
    assert results['Metro Vancouver'][2].name == "Metro Vancouver - Zebra"
  end

  test "should have sorted groups" do
    groups = ["Metro Vancouver", "Aa the start", "Zzz the end"]
    items = [   
                to_mash({ :name => "Zzz the end - Z", :uuid => 6 }),
                to_mash({ :name => "Zzz the end - 1", :uuid => 7 }),                                
                to_mash({ :name => "Metro Vancouver - Zebra", :uuid => 2 }), 
                to_mash({ :name => "Metro Vancouver - Ant", :uuid => 3 }),
                to_mash({ :name => "Aa the start - Z", :uuid => 4 }),
                to_mash({ :name => "Aa the start - 1", :uuid => 5 }),                                
            ]

    results = group(items, groups)
    
    assert results

    count = 0
    results.each do |key, value|
      if key != 'non_grouped'
        if count == 0
          assert key == "Aa the start"
        elsif count == 1
          assert key == "Metro Vancouver"
        elsif count == 2 
          assert key == "Zzz the end"
        end
        count = count + 1
      end
    end
  end
  
  test "should group National Park" do
    names = [ "National Park Service - Tallgrass Prairie National Preserve Catalog Units",
              "National Park Service - Standing Fuel Inventory Community Compositions and Vegetation Types at Capulin Volcano National Monument",
              "National Park Service - Roads and Trails at Capulin Volcano National Monument",
              "National Park Service - Utility Lines at Capulin Volcano National Monument",
            ]
    groups = find_groups(names)
    
    assert groups
    assert !groups.index("National Park Service").nil?
  end
  
  test "should remove of from Time Zones of" do
    names = [ "Time Zones of China",
              "Time Zones of Russia",
              "Time Zones of the World",
              "Time Zones of the United States"
            ]
    groups = find_groups(names)
    
    assert groups
    assert !groups.index("Time Zones of").nil?
    
    groups = clean_groups(groups)
    
    assert groups
    assert !groups.index("Time Zones").nil?        
  end
  
  test "should group Hawaii" do
    names = [ "Hawaii Wind Resource Potential",
              "Hawaii Solar Resource Potential"
            ]
    groups = find_groups(names)
    
    assert groups
    assert !groups.index("Hawaii").nil?
  end

  test "should group items with like GeoBC Database: Fire Perimeters - Current" do
    groups = [  "GeoBC",
                "GeoBC Database",
                "GeoBC Database: Fire"
             ]
    items = [   
                to_mash( :name => "GeoBC Database: Hydrology: Normal Annual Runoff Isolines (1961 - 1990)", :uuid => 4 ),
                to_mash( :name => "GeoBC Database: Fire Perimeters - Current", :uuid => 1 ),
                to_mash( :name => "GeoBC Database: Flood Protection Works - Structural Works", :uuid => 2 ),
                to_mash( :name => "GeoBC Database: Wells", :uuid => 3 ),
            ]
    groups = group(items, groups)
    
    assert groups

    assert groups['non_grouped'] && groups['non_grouped'].count == 0
    assert groups['GeoBC Database'] && groups['GeoBC Database'].count == 4
  end
  
  test "should group National" do
    groups = [  "National",
                "National Road",
                "National Hydro Network",
                "National Road Network",
                "National Road Junction"
             ]
    items = [   to_mash( :name => "National Hydro Network 05 AB Bank", :uuid => 1 ),
                to_mash( :name => "National Hydro Network 05 AB Bank", :uuid => 2 ),
                to_mash( :name => "National Road Network Alberta Junctions 01", :uuid => 4 ),   
                to_mash( :name => "National Road Junction 10 AB Hydrojunction", :uuid => 5 ),
                to_mash( :name => "National Road 10 AB Hydrojunction", :uuid => 6 )
            ]
     groups = group(items, groups)
     
     assert groups
     assert groups['National'] && groups['National'].count == 0
  end
  
  def to_mash(hash)
    Hashie::Mash.new(hash)
  end  
end
