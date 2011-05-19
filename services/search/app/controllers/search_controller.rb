class SearchController < ApplicationController
  
  
  def search_instance
    if @search_instance == nil
      @search_instance = Search.new
    end
    @search_instance
  end
  
  def index
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query)
  end
  
  def query    
    @search = search_instance.do_query(params[:keywords])
    render :partial => "search_results"    
  end
  
  def info
    id = params[:id]      
    if id != nil
      render :json => search_instance.info(id)
    end
  end
    
  def refresh
    search_instance.refresh
    render :text => 'Success!'
  end
  
  def dataset
    col             = File.read('public/my_collection.json')
    @my_collection  = JSON.parse(col)
    
    recently        = File.read('public/recently_view.json')
    @recently_view  = JSON.parse(recently)
    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query)
    
  end
      
end
