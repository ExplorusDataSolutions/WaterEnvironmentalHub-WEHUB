class CatalogueController < ApplicationController

  def index
    @main_menu = 'home'
  end

  def search
  end

  def details   
    @dataset = catalogue_instance.dataset(params[:id])
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def browse
    @breadcrumb = ['Water Data Catalogue', 'Browse']
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query, nil, nil)
  end
  
  def my_collection
    @breadcrumb = ['My Collection']
    @main_menu = 'we_catalogue'
  end

end
