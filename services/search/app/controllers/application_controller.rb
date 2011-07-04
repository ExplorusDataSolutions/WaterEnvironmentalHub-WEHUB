load 'enginey_translator.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper ApplicationHelper

  before_filter :fetch_recently_viewed_search_results, :fetch_user_saved_search_results

  def fetch_recently_viewed_search_results
    if !current_user.nil?
      @recently_viewed_search_results = search_results_from_datasets(catalogue_instance.find_recently_viewed(current_user.id))
    end
  end

  def fetch_user_saved_search_results
    if !current_user.nil?
      @user_saved_search_results = search_results_from_datasets(catalogue_instance.find_saved(current_user.id))
    end
  end
  
  def current_user
    session[:user]
  end

  def search_instance
    if @search_instance.nil?
      @search_instance = Search.new
    end
    @search_instance
  end

  def catalogue_instance
    if @catalogue.nil?
      @catalogue = CatalogueTranslator.new("http://#{request.host}:3000")
    end
    @catalogue
  end

  def socialnetwork_instance
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new(session)
    end
    @socialnetwork
  end

  private

  def search_results_from_datasets(datasets)
    results = []
    JSON.parse(datasets).each do |dataset| 
      results.push(search_instance.info(dataset['dataset']['uuid']))
    end
    results
  end
  
  def verify_logged_in
    if current_user.nil?
      redirect_to :controller => 'user', :action => 'sign_in'
    end
  end

  def fetch_user_groups
    if !current_user.nil?
      @user_profile_groups = socialnetwork_instance.user_groups(current_user.id)
    end
  end

  def fetch_user_datasets
    if !current_user.nil?
      @user_profile_datasets = catalogue_instance.find_datasets_by_user(current_user.id)
    end
  end

  def fetch_profile
    if !current_user.nil?  
      @profile = socialnetwork_instance.profile(current_user.id)
    end
  end  

end
