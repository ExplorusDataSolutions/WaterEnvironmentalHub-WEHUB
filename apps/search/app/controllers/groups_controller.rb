class GroupsController < ApplicationController

  before_filter :verify_logged_in
  
  caches_action :show, :cache_path => :groups_key.to_proc, :expires_in => 5.minutes
  
  def update
    begin
      expire_fragment groups_key
      socialnetwork_instance.group_update(params)
    rescue
    end  
    redirect_to :controller => :community, :action => :groups, :anchor => :mine, :group_id => params[:id]
  end
  
  def edit
    role = socialnetwork_instance.group_role(params[:id])
    if role.nil? || role[0].scan(/admin/).empty?
      redirect_to :action => 'show', :anchor => 'mine'
    end
    
    @breadcrumb = ['Groups', 'Edit']
    @main_menu = 'we_community'

    @group = socialnetwork_instance.group(params[:id])
    @members = socialnetwork_instance.group_members(params[:id])
    if !@members.nil? && !@members.empty?
      @members_auth = @members.select { |k,v| k[:authorized] == true } 
      @members_no_auth = @members.select { |k,v| k[:authorized] != true }
    end
    
    render :layout => false
  end

  def new
    render :layout => false
  end
  
  def create
    group = socialnetwork_instance.group_create(params)
    socialnetwork_instance.membership_create({ :user_id => current_user.id, :group_id => group.id })
    expire_fragment groups_key
    redirect_to :action => 'show', :anchor => 'mine', :id => group.id
  end
  
  # This should be in its own controller
  def members
    if request.post?
      if params.key? :authorize
        socialnetwork_instance.membership_authorize(params)
      elsif params.key? :delete        
        socialnetwork_instance.membership_delete(params)
      elsif params.key? :promote
        socialnetwork_instance.membership_promote(params)
      end
      expire_fragment groups_key
      redirect_to :controller => :community, :action => :groups, :anchor => :mine
    end
  end
  
  def groups_key
    "groups/user/#{current_user.id}"
  end
  
  def show
    @breadcrumb = ['Community','Groups']
    @main_menu = 'we_community'

    @my_groups = socialnetwork_instance.user_groups(current_user.id)
    all_groups = socialnetwork_instance.groups_all
    if @my_groups
      @groups = ((@my_groups | all_groups) - @my_groups)
    else
      @groups = all_groups
    end
    
    @my_groups.each_with_index do |g, i|
      role = socialnetwork_instance.group_role(g.id)
      if !role.nil?
        @my_groups[i] = @my_groups[i].merge({ :role => socialnetwork_instance.group_role(g.id)[0] })
      end
      @my_groups[i].datasets = catalogue_instance.find_datasets_by_group(g.id)
 
    end unless @my_groups.nil?
    
    @groups.each_with_index do |g, i|
      if !g.private?
        @groups[i].datasets = catalogue_instance.find_datasets_by_group(g.id)
      end
    end
    
    @groups
  end

  def join
    begin
      socialnetwork_instance.membership_create({ :user_id => current_user.id, :group_id => params[:id] })
      expire_fragment groups_key
    rescue
    end
    redirect_to :action => 'show', :anchor => 'mine'
  end

end
