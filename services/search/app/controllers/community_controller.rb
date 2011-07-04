class CommunityController < ApplicationController

  def index
    @breadcrumb = ['Community']
    @main_menu = 'we_community'
  end
    
  def profile_activity
    @breadcrumb = ['Profile', 'Kashif Anjum']
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
