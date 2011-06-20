class SearchController < ApplicationController
    
  def index
    query = 'all'
    if params[:query] != nil && !params[:query].empty?
      query = params[:query]
    end

    f = File.read('public/4.json')
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
