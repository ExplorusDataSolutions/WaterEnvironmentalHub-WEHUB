class CatalogueController < ApplicationController
  def index
    @style_sheet   = "pages/home"
    @main_menu     = 'home'
  end

  def search
  end

  def details
    col             = File.read('public/my_collection.json')
    @my_collection  = JSON.parse(col)
    
    recently        = File.read('public/recently_view.json')
    @recently_view  = JSON.parse(recently)
    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    @breadcrumb[1]  = 'Detail View'
    @main_menu      = 'we_catalogue'
    
    @rating         = (4*138)/5; 
  end
end
