class Search
  attr_accessor :results, :query
  
  def initialize(query)
    translator = GeoNetworkTranslator.new
    @results = translator.search_results(query)
    @query = query
  end
end