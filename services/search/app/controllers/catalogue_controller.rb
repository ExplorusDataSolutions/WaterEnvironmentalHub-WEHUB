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
    @main_menu = 'home'
  end

  def search
  end

  def details   
    @breadcrumb = ['WE Catalogue', 'Detail View']
    @main_menu      = 'we_catalogue'
    
    @rating         = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb = ['WE Catalogue', 'Detail View']
    @main_menu      = 'we_catalogue'
    
    @rating         = (4*138)/5; 
  end
  
  def browse
    @breadcrumb = ['WE Catalogue', 'Browse']
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query)
  end
  
  def my_collection
    @breadcrumb     = ['My Collection']
    @main_menu      = 'we_catalogue'
  end

end
