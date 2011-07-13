class CommunityController < ApplicationController
  before_filter :verify_logged_in, :fetch_user_groups, :fetch_user_datasets, :fetch_profile
  
  def index
    @breadcrumb = ['Community']
    @main_menu = 'we_community'
  end
    
  def profile_activity
    @breadcrumb = ['Profile']
    @main_menu = 'we_community'
  end
   
  def friends
    @breadcrumb = ['Community', 'Friends']
    @main_menu = 'we_community'

    users = socialnetwork_instance.users
    friends = socialnetwork_instance.friends(current_user.id)
    
    filtered_user_ids = []
    users.each { |u| filtered_user_ids.push(u.id) }
    
    friend_ids = []
    friends.each { |u| friend_ids.push(u.id) }
    
    filtered_user_ids = (friend_ids | filtered_user_ids) - friend_ids - [current_user.id.to_s]
    
    @users = []
    users.each do |user|
      if filtered_user_ids.include?(user.id)
        @users.push(user)
      end
    end
    
    @friends = friends
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
