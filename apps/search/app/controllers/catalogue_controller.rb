class CatalogueController < ApplicationController

  include CatalogueHelper

  caches_page :index, :details
  caches_action :browse, :cache_path => Proc.new { |controller| controller.params }  

  def index
    @breadcrumb = ['Home']
    @main_menu = 'home'

    @datasets_counter = catalogue_instance.datasets_by_type
    @datasets_latest = catalogue_instance.datasets_last_uploaded
    
    @search = search_instance.do_query('all', nil, nil, nil)
  end

  def participate
    @breadcrumb = ['Discover Our Data', 'How To Participate']
    @main_menu = 'we_catalogue'
    
    render 'about/participate'  
  end

  def platform
    @breadcrumb = ['Discover Our Data', 'Data Platform']
    @main_menu = 'we_catalogue'
    
    render 'about/platform'
  end
  
  def search
  end

  def details   
    @dataset = catalogue_instance.dataset(params[:id])
    
    @breadcrumb = ['Discover Our Data', 'This Dataset']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def browse
    @breadcrumb = ['Discover Our Data', 'Browse']
    @main_menu = 'we_catalogue'
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query, nil, nil)
    results = @search.results
    
    page = params[:page]
    if page
      page = Integer(page)-1
      @search.results = results[(page*page_size)..(page*page_size+page_size-1)]
      @current = page+1
    else
      @search.results = results[0..page_size-1]
      @current = 1
    end
    
    @pages = Integer(results.count / page_size)    
      
    @base_data = build_groups(@search.base_data.dup)

    @observation_data = build_groups(@search.observation_data.dup)
  end
  
  def page_size
    10
  end
  
  def user_collection
    @breadcrumb = ['My Collection']
    @main_menu = 'we_catalogue'
    
    @results = search_results_from_datasets(catalogue_instance.find_saved(current_user.id))
        
    @pages = 1
  end
  
end
