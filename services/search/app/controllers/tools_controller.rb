class ToolsController < ApplicationController

  def index
    @breadcrumb     = ['WE Tools']
    @main_menu      = 'we_tools'
  end
  
  def chart
    @breadcrumb     = ['WE Tools','We Data Graph']
    @main_menu      = 'we_tools'
  end
  
  def table
    @breadcrumb     = ['WE Tools','We Data Graph']
    @main_menu      = 'we_tools'
  end
  
  def map
    @breadcrumb     = ['WE Tools','We Data Map']
    @main_menu      = 'we_tools'
  end
  
  def developers
    @breadcrumb     = ['WE Tools','Developers']
    @main_menu      = 'we_tools'
  end

end
