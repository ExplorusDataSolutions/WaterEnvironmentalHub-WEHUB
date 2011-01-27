#require 'geonetwork_repository.rb'

class Search  
  
  def query
    if @query == nil
      @query = 'water'
    end
    @query
  end
  
  def initialize(query)
    @query = query
  end
  
  def test
    
    #weary = GeoNetworkRepository.new
    #weary.show('mwunsch','weary').perform do |response|
    #  response.body
    #end
    #'test'
    #weary.find('test')
    url = URI.parse('http://174.129.10.37:8080/geonetwork/srv/en/rss.search')
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><any>#{query}</any></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    hash = Hash.from_xml response.body.gsub("localhost", "174.129.10.37")
    
    items = hash.fetch("rss").fetch("channel").fetch("item")

  end

end

class SearchResult
  
  def description
  end
  
  def title
  end
  
  def resources
  end
      
  def thumbnail
  end
  
  def source
  end
end

class GeoNetworkRepository
  
end
