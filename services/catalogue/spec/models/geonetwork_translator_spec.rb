require 'spec_helper'

describe GeoNetworkTranslator do
  before do
    @translator = GeoNetworkTranslator.new 
  end
  
  it "nothing is translated" do 
    results = @translator.translate_from_search('')
    results.count.should eql 0
  end

  it "search_results are translated" do 
    results = @translator.translate_from_search(File.read(File.dirname(__FILE__) + '/../data/geonetwork_search_water_rss.xml'))    
    
    results.count.should eql 3    
    assert_equal 'Hydrological Basins in Africa (Sample record, please remove!)', results[0].title
    results[0].description.index('Major hydrological basins and their sub-basins.').should_not eql nil

    results[0].resources.count.should eql 5
        
    resource = results[0].resources[0]
    assert_equal "Online link to the 'Water Resources and Irrigation in Africa'- website", resource.title
    assert_equal 'http://www.fao.org/ag/AGL/aglw/aquastat/watresafrica/index.stm', resource.uri
    assert_equal 'text/html', resource.type

    resource = results[0].resources[1]
    assert_equal 'http://174.129.10.37:8080/geonetwork/srv/en/resources.get?id=10&fname=basins.zip&access=private', resource.uri
    
    assert_equal '/geonetwork/srv/en/resources.get?id=21&fname=thumbnail_s.gif&access=public', results[0].thumbnail
    assert_equal '06 Nov 2007 12:13:00 EST', results[0].publication_date
  end
  
  it "search_uri is correct" do
    assert_equal 'http://174.129.10.37:8080/geonetwork/srv/en/rss.search', @translator.search_uri
  end
end
