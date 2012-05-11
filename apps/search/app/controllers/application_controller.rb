load 'enginey_translator.rb'

class ApplicationController < ActionController::Base
  #turning this off to enable caching
  #protect_from_forgery

  helper ApplicationHelper
  
  def anonynmous_id
    request.remote_ip.scan(/\d+/)[1..3].join.to_i * -1
  end
  
  def current_user
    session[:user]
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def search_instance
    if @search_instance.nil?
      @search_instance = Search.new(Rails.application.config.geonetwork_address, Rails.cache, nil)
    end
    @search_instance
  end

  def catalogue_instance
    if @catalogue.nil?
      @catalogue = CatalogueTranslator.new(Rails.application.config.catalogue_address, Rails.cache)
    end
    @catalogue
  end

  def socialnetwork_instance
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new(Rails.application.config.enginey_address, session)
    end
    @socialnetwork
  end

  private

  def search_results_from_datasets(datasets)
    results = []
    JSON.parse(datasets).each do |dataset| 
      search_result = search_instance.info(dataset['dataset']['uuid'])
      results.push(search_result) unless !search_result
    end
    results
  end
  
  def verify_logged_in
    if current_user.nil?
      cookies.delete :we_hub
      redirected_from = request.request_uri
      redirect_to :controller => 'user', :action => 'sign_in'
    end
  end
  
  def redirected_from=(value)
    session[:redirected_from] = value
  end
  
  def redirected_from
    session[:redirected_from]
  end
  
end
