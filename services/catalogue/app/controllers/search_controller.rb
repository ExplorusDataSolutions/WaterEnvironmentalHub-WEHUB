require 'geonetwork_translator.rb'

class SearchController < ApplicationController
  def index    
  end
  
  def show
  end
  
  def create
    translator = GeoNetworkTranslator.new
    query = params[:search][:query]
    @results = translator.search_results(query)
  end
end
