class SearchController < ApplicationController
    
  def index
    query = 'all'
    if params[:query] != nil && !params[:query].empty?
      query = params[:query]
    end

    f = File.read('public/4.json')
    @json = f.strip

    user_id = current_user.id

    group_ids = []
    groups = socialnetwork_instance.user_groups(user_id)
    if !groups.nil?
      groups.each do |group|
        group_ids.push(group.id)
      end
    end

    @search = search_instance.do_query(params[:keywords], params[:datasets], user_id, group_ids)
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
