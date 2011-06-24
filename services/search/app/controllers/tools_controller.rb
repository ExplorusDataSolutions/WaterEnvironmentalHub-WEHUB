class ToolsController < ApplicationController

  def index
    @breadcrumb     = ['WE Tools']
    @main_menu      = 'we_tools'
  end
  
  def chart
    @id = params[:id]
    f = File.read('public/chart.json')
    @json = f.strip
    @breadcrumb     = ['WE Tools','We Data Graph']
    @main_menu      = 'we_tools'
  end
  
  def table
    @breadcrumb     = ['WE Tools','We Data Graph']
    @main_menu      = 'we_tools'
  end
  
  def map
    @id = params[:id]
    f = File.read('public/6.json')
    @json = f.strip
    @breadcrumb     = ['WE Tools','We Data Map']
    @main_menu      = 'we_tools'
  end
  
  def developers
    @id = params[:id]
    @breadcrumb     = ['WE Tools','Developers']
    @main_menu      = 'we_tools'
  end
  
  def add_new_dataset
    @id     = params[:hid_last_cnt]
    render :layout => false
  end
  
  def add_new_dataset_map
    @id     = params[:hid_last_cnt]
    render :layout => false
  end

end
