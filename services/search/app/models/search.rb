

class Search
  attr_accessor :results, :query, :basedata
  
  def initialize(query)
    geonetwork = GeoNetworkTranslator.new
    geoserver = GeoServerTranslator.new
    @results = geonetwork.search_results(query)
    @basedata = geoserver.capabilities
    @query = query
  end
end