require 'spec_helper'

describe SearchResult do
  
  it "Should create new SearchResult" do 
    
    description = 'my description'
    title = 'my title'
    thumbnail = 'my thumbnail'
    source = 'my source'
    pub_date = 'my pub date'
    id = 'my id'
    
    @result = SearchResult.new(description, title, nil, thumbnail, source, pub_date, id)
    
    assert_equal description, @result.description
    assert_equal title, @result.title
    assert_equal thumbnail, @result.thumbnail
    assert_equal source, @result.source
    assert_equal pub_date, @result.publication_date
    assert_equal id, @result.id
  end
end
