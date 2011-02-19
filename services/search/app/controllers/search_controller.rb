class SearchController < ApplicationController
  
  def index
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end
    @search = Search.new(query)
  end
  
  def query
    @search = Search.new(params[:keywords])
    render :partial => "search_results"    
  end
  
  def info
    id = params[:id]      
    if id != nil
      @search = Search.new(params[:keywords]);
      @search.results.each do |result|
        if result.id == id
          render :json => result
        end
      end
    end
  end
    
end
