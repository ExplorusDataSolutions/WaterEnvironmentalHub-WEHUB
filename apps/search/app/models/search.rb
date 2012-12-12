require 'geonetwork_translator.rb'
require 'catalogue_translator.rb'

class Search
  attr_accessor :results, :query, :properties, :base_data, :observation_data, :all_results
  
  def geonetwork
    @geonetwork
  end
  
  def catalogue
    @catalogue
  end

  def initialize(geonetwork_address='http://localhost:8080', cache={}, query='')
    @geonetwork = GeoNetworkTranslator.new(geonetwork_address, cache)

    @catalogue = CatalogueTranslator.new
    
    if query
      @results = geonetwork.search_results(query)
      # These numeric values correspond to GeoNetwork groups
      @base_data = geonetwork.search_results_by_groups(["6", "3"])
      @observation_data = geonetwork.search_results_by_groups(["4", "5"])
      @query = query
    end
  end

  def load_browse_data  
      # These numeric values correspond to GeoNetwork groups
      @base_data = geonetwork.search_results_by_groups(["6", "3"])
      @observation_data = geonetwork.search_results_by_groups(["4", "5"])
      self
  end

  def do_query(keywords, target='public', user_id, group_ids, geonetwork_target)
    if target.nil?
      target = 'public'
    end
    @results = []
    if target.scan(/mine/).any? && target.scan(/shared/).any?
      results = catalogue.find_datasets_by_keyword(keywords, user_id, group_ids)
      @results |= results unless results.nil?
    elsif target.scan(/mine/).any?
      results = catalogue.find_datasets_by_keyword(keywords, user_id, nil)
      @results |= results unless results.nil?
    elsif target.scan(/shared/).any?
      results = catalogue.find_datasets_by_keyword(keywords, nil, group_ids)
      @results |= results unless results.nil?
    end

    if target.scan(/public/).any?
      @results |= geonetwork.search_results(keywords, geonetwork_target)
    end
    
    @query = find_query(keywords)
    
    self
  end
  
  def do_query_advanced(keywords, date_start, date_end, south, east, north, west)
    @results = geonetwork.search_results_advanced(keywords, date_start, date_end, south, east, north, west)

    @query = find_query(keywords)
    
    self
  end
  
  def find_query(keywords)
    if keywords.is_a?(Hash) 
      if keywords[:keywords] 
        if !keywords[:keywords].nil?
          keywords[:keywords]
        else
          ''
        end
      end
    else
      keywords
    end
  end

  def info(id)
    geonetwork.search_result(id)
  end
  
  def refresh
    @geonetwork.refresh
  end
end
