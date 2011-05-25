class CommunityController < ApplicationController

  def index
    @breadcrumb     = ['WE Community']
    @main_menu      = 'we_community'
  end
    
  def profile_activity
    @breadcrumb     = ['Profile','Kashif Anjum']
    @main_menu      = 'we_community'
  end
   
  def friends
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end
  
  def groups
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end
  
  def me
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end
  
  def find_friends
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end

  def edit_friends
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end
  
end
