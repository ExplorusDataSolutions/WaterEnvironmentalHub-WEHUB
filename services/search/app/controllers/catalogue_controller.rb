class CatalogueController < ApplicationController

  def catalogue
    if @catalogue.nil?
      @catalogue = CatalogueTranslator.new
    end
    @catalogue
  end

  def search_instance
    if @search_instance.nil?
      @search_instance = Search.new
    end
    @search_instance
  end


  def index
    @main_menu     = 'home'
  end

  def search
  end

  def details   
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    @breadcrumb[1]  = 'Detail View'
    @main_menu      = 'we_catalogue'
    
    @rating         = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    @breadcrumb[1]  = 'Detail View'
    @main_menu      = 'we_catalogue'
    
    @rating         = (4*138)/5; 
  end
  
  def simplesearch   
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    
  end
  
  def advancesearch    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
  end

end
