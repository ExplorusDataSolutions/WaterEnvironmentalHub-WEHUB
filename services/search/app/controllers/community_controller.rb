class CommunityController < ApplicationController

  before_filter :verify_logged_in
  
  caches_action :friends, :cache_path => :friends_key.to_proc, :expires_in => 30.minutes

  def index
    @breadcrumb = ['Community']
    @main_menu = 'we_community'
  end
    
  def profile_activity
    @breadcrumb = ['Profile']
    @main_menu = 'we_community'
  end
  
  def friends_key
    "community/friends/user/#{current_user.id}"
  end
  
  def friends
    @breadcrumb = ['Community', 'Friends']
    @main_menu = 'we_community'

    users = socialnetwork_instance.users
    friends = socialnetwork_instance.friends(current_user.id)
    
    filtered_user_ids = []
    users.each { |u| filtered_user_ids.push(u.id) } unless users.nil?
    
    friend_ids = []
    friends.each { |u| friend_ids.push(u.id) } unless friends.nil?
    
    filtered_user_ids = (friend_ids | filtered_user_ids) - friend_ids - [current_user.id.to_s]
    
    @users = []
    users.each do |user|
      if filtered_user_ids.include?(user.id)
=begin
        datasets = catalogue_instance.find_datasets_by_user(user.id)
        if datasets
          user.datasets = datasets
        end
=end
        @users.push(user)
      end
    end unless users.nil?
    
    @friends = []
    friends.each do |friend|
=begin
      datasets = catalogue_instance.find_datasets_by_user(friend.id)
      if datasets
        friend.datasets = datasets
      end
=end
      @friends.push(friend)
    end unless friends.nil?

  end
  
  def befriend
    if params[:id]
      socialnetwork_instance.friend_add(params[:id])
      expire_fragment friends_key      
      redirect_to :action => 'friends'
    end
  end

  def unfriend
    if params[:id]
      socialnetwork_instance.friend_remove(current_user.id, params[:id])
      expire_fragment friends_key
      redirect_to :action => 'friends'
    end
  end
  
  def news
    @breadcrumb = ['Community', 'News']
    @main_menu = 'we_community'
  end
    
  def edit_friends
    @breadcrumb = ['Community', 'Friends']
    @main_menu = 'we_community'
  end
  
  def group_view
    @breadcrumb = ['Community','Groups']
    @main_menu = 'we_community'
  end
    
end
