require 'geonetwork_translator.rb'

class SearchController < ApplicationController
  def index
  end
  
  def show
    @search = Search.new(params[:keyword])
    render :partial => "search_results"
  end
  
  def create    
    if params == nil || params[:search] == nil || params[:search][:query] == nil
      @search = Search.new('all')  
    else
      @search = Search.new(params[:search][:query])
    end
  end
  
end
