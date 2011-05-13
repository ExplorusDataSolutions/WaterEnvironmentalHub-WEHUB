class ToolsController < ApplicationController

  def chart
    f = File.read('public/chart.json')
    @json = f.strip
    
    col             = File.read('public/my_collection.json')
    @my_collection  = JSON.parse(col)
    
    recently        = File.read('public/recently_view.json')
    @recently_view  = JSON.parse(recently)
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Tools'
    @breadcrumb[1]  = 'WE Data Graph'
    @main_menu      = 'we_tools'
  end

end
