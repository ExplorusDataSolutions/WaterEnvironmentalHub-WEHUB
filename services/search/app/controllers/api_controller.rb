class ApiController < ApplicationController
  
  caches_page :builder
  caches_action :dataset, :datasets, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours
  caches_action :builder_response, :cache_path => Proc.new { |c| c.params.delete_if { |k,v| k.starts_with?('utf8') || k.starts_with?('authenticity_token') }}, :expires_in => 24.hours
  
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
    render :text => catalogue_instance.api_feature_raw(params)
  end
  
  def is_feature_external
    render :text => catalogue_instance.api_is_feature_external(params[:id])
  end
  
  def builder_response  
    @info_type = params[:info_type]
    @datasets = params[:datasets]
    @output = params[:output]
    
    if @info_type
      if @info_type == 'dataset'
        @response = catalogue_instance.api_dataset_raw(params[:datasets], params[:output])
      else
        @bounds = ''
        if params[:north] && !params[:north].empty?
          @bounds = { :north => params[:north], :east => params[:east], :south => params[:south], :west => params[:south] }.to_query
          @bounds = "&#{@bounds}"
        end
        
        @extent = ''
        if params[:start] && !params[:start].empty?
          @extent = { :start => params[:start], :end => params[:end] }.to_query
          @extent = "&#{@extent}"
        end
        
        @response = catalogue_instance.api_feature_raw(params)

        if @response.strip.empty?
          render :nothing =>  true, :status => :not_found and return
        end

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
