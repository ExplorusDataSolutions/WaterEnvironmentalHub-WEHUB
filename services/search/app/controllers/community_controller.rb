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
    @main_menu      = 'we_community'
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
