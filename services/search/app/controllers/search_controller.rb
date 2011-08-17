class SearchController < ApplicationController
    
  def index

    query = 'all'
    if !(params[:query].nil? || params[:query].empty?)
      query = params[:query]
    end
    if !(params[:keywords].nil? || params[:keywords].empty?)
      if query == 'all'
        query = params[:keywords]
      end
    end

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

    @search = search_instance.do_query(query, params[:datasets], user_id, group_ids)  
    results = @search.results
    
    page = params[:page]
    if page
      page = Integer(page)-1
      @search.results = results[(page*page_size)..(page*page_size+page_size-1)]
      @current = page+1
    else
      @search.results = results[0..page_size-1]
      @current = 1
    end
    
    @pages = Integer(results.count / page_size)
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
    search_instance.refresh
    render :text => 'Success!'
  end
        
end
