require 'geonetwork_translator.rb'

class Search
  attr_accessor :results, :query, :base_data, :observation_data
  
  def geonetwork
    @geonetwork
  end
  
  def initialize(query='all')
    @geonetwork = GeoNetworkTranslator.new
    
    @results = geonetwork.search_results(query)
    @base_data = geonetwork.search_results_by_groups(["20", "21"])
    @observation_data = geonetwork.search_results_by_groups(["22", "23"])
    @query = query
  end
  
  def do_query(query)
    @results = geonetwork.search_results(query)
    @query = query
    
    self
  end
  
  def info(id)
    geonetwork.search_result(id)
  end
end