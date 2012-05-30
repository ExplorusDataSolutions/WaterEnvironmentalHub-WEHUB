class SearchController < ApplicationController

  include SearchHelper
  
  caches_action :index, 
    :if => Proc.new { (params[:datasets].nil? && params[:type].nil?) || (params[:datasets] == 'public' && params[:type] == 'simple') || (params[:datasets].nil? && params[:type] == 'simple') || (params[:type].nil? && params[:datasets] == 'public') }, 
    :cache_path => Proc.new { "?keywords=#{params[:keywords] ? params[:keywords] : (params[:query] ? params[:query] : 'all')}&page=#{params[:page] ? params[:page] : 0}&properties=#{params[:properties] ? params[:properties] : ''}" }
  
  def index
    @breadcrumb = ['Discover Our Data', 'Search']
    @main_menu = 'we_catalogue'

    query = ''
    search_target = ''
    if params[:keywords] || params[:query] || params[:properties]
      if !param_default(params[:query], constants.text.search) && param_provided(params[:query])
        query = params[:query]
      end

      if !param_default(params[:keywords], constants.text.search) && param_provided(params[:keywords])
        query = params[:keywords]
      end        
      if !param_default(params[:properties], constants.text.properties) && param_provided(params[:properties])
        query = { :properties => params[:properties] }
        query.store(:keywords, params[:keywords]) if !param_default(params[:keywords], constants.text.search)
        search_target = 'properties'
      end
    end
    
    if (params[:type].nil? || params[:type] == 'simple')
      user_id = nil
      group_ids = nil
      
      if !current_user.nil?
        user_id = current_user.id

        group_ids = []
        groups = socialnetwork_instance.user_groups(user_id)
        if !groups.nil?
          groups.each do |group|
            group_ids.push(group.id)
          end
        end
      end

      @search = search_instance.do_query(query, params[:datasets], user_id, group_ids, search_target)
      results = @search.results
    else     
      query = { :keywords => params[:keywords], :properties => params[:properties] }
      @search = search_instance.do_query_advanced(query, params[:date_start], params[:date_end], params[:south], params[:east], params[:north], params[:west])
      results = @search.results    
    end
    
    @all_results_count = @search.results.count
    page = params[:page]
    if page && results
      page = Integer(page)-1
      @search.results = results[(page*page_size)..(page*page_size+page_size-1)]
      @current = page+1
    else
      @search.results = results[0..page_size-1]
      @current = 1
    end
    
    @pages = (Float(results.count) / Float(page_size)).ceil
  end
  
  def page_size
    10
  end
        
  def info
    id = params[:id]      
    if id != nil
      render :json => search_instance.info(id)
    end
  end
    
  def refresh
    if self.request.remote_addr == 'localhost' || self.request.remote_addr == '127.0.0.1'
      Rails.cache.clear
      render :text => 'Success!' and return
    end
    render :text => 'Fail!' and return
  end     
end
