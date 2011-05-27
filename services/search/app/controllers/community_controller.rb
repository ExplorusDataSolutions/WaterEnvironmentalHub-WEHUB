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
  
  def datasets
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'
  end

  def news
    @breadcrumb     = ['WE Community','News']
    @main_menu      = 'we_community'
  end
    
  def edit_friends
    @breadcrumb     = ['WE Community','Friends']
    @main_menu      = 'we_community'
  end
  
  def group_view
    @breadcrumb     = ['WE Community','Groups']
    @main_menu      = 'we_community'
  end
  def dataset_upload
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'
  end  
  
end
