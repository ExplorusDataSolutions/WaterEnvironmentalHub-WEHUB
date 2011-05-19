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
  
  def comment
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
  
  def simplesearch
    col             = File.read('public/my_collection.json')
    @my_collection  = JSON.parse(col)
    
    recently        = File.read('public/recently_view.json')
    @recently_view  = JSON.parse(recently)
    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    
  end
  
  def advancesearch
    col             = File.read('public/my_collection.json')
    @my_collection  = JSON.parse(col)
    
    recently        = File.read('public/recently_view.json')
    @recently_view  = JSON.parse(recently)
    
    @breadcrumb     = Array.new
    @breadcrumb[0]  = 'WE Catalogue'
    
  end

  def recently_viewed_datasets
    render :json => search_results_from_datasets(JSON.parse(catalogue.find_recently_viewed(params[:user_id])))
  end

  def user_datasets
    render :json => search_results_from_datasets(JSON.parse(catalogue.find_collection(params[:user_id])))
  end

  def search_results_from_datasets(datasets)
    results = []
    datasets.each do |dataset| 
      results.push(search_instance.info(dataset['dataset']['uuid']))
    end
    results
  end

end
