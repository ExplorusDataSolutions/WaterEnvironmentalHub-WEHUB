require 'geonetwork_translator.rb'

class Search
  attr_accessor :results, :query, :base_data, :observation_data
  
  def initialize(query)
    geonetwork = GeoNetworkTranslator.new
    
    @results = geonetwork.search_results(query)
    @base_data = geonetwork.search_results_by_group(["20", "21"])
    @observation_data = geonetwork.search_results_by_group(["22", "23"])
    @query = query
  end
end