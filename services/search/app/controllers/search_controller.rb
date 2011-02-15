require 'geonetwork_translator.rb'

class SearchController < ApplicationController
  def index    
  end
  
  def show
    @search = Search.new(params[:keyword])
    render :partial => "search_results"
  end
  
  def create
    @search = Search.new(params[:search][:query])
  end
  
end
