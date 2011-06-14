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

    f = File.read('public/point.json')
    @json = f.strip
    
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
        
end
