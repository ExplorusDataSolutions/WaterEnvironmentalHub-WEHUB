class ApiController < ApplicationController

  respond_to :json, :xml

  respond_to :html, :only => ['builder_result']

  before_filter :verify_logged_in, :only => [:builder, :builder_response]  
  before_filter :verify_api_key, :only => [:dataset, :feature]
  
  def builder
    @breadcrumb = ['Build An App', 'API Builder']
    @feature_types = catalogue_instance.api_feature_types
    @main_menu = 'api'
  end
    
  def datasets
    @datasets = catalogue_instance.api_datasets(params[:feature_type_id])

    respond_with(@datasets) do |format|
      format.html { render :partial => 'datasets' }
    end    
  end
  
  def dataset
    render :text => catalogue_instance.api_dataset_raw(params[:id], params[:output])
  end
  
  def feature  
    render :text => catalogue_instance.api_feature_raw(params[:id], params[:output])
  end
  
  def builder_response  
    @info_type = params[:info_type]
    @datasets = params[:datasets]
    @output = params[:output]
    
    if @info_type
      if @info_type == 'dataset'
        @response = catalogue_instance.api_dataset_raw(params[:datasets], params[:output])
      else
        @response = catalogue_instance.api_feature_raw(params[:datasets], params[:output])
      end
    end

    render :partial => 'builder_response'
  end
  
  private
  
  def verify_api_key
    if logged_in?
      return true
    else

      key = params[:key]
      begin
        socialnetwork_instance.verify_api_key(key) unless key.nil?
        return true
      rescue
        render :status => :forbidden, :text => 'You need to be logged in or use a valid key to gain access to the API' and return
      end
    end
  end 
  
end
