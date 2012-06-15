class ApiController < ApplicationController
  
  include SearchHelper
  
#  caches_action :dataset, :datasets, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours
  
  respond_to :json, :xml

  respond_to :html, :only => ['builder_result']

  before_filter :verify_logged_in, :only => [:builder, :builder_response]  
  before_filter :verify_api_key, :only => [:dataset, :feature]
  
  include CatalogueHelper
  
  def builder
    @breadcrumb = ['Build An App', 'API Builder']
    @feature_types = catalogue_instance.api_feature_types
    @main_menu = 'api'
  end
    
  def datasets
    feature_type_id = params[:feature_type_id]

    date_start = params[:start]
    date_end = params[:end]
    north = params[:north]
    east = params[:east]
    south = params[:south]
    west = params[:west]

    if !build_query(params).empty?
      search = search_instance.do_query(build_query(params), nil, nil, 'properties')
      @datasets = search.results      
    elsif ((date_start && date_end) && !(date_start.empty? && date_end.empty?)) || ((north && east && south && west) && !(north.empty? && east.empty? && south.empty? && west.empty))
      search = search_instance.do_query_advanced('all', date_start, date_end, south, east, north, west)
      @datasets = search.results
      if !@datasets.nil? || !@datasets.empty?
        @datasets.sort_by! { |dataset| dataset.name } 
      end
    end
    if @datasets.nil? || @datasets.empty?
      render :status => 500 and return
    else
      respond_with(@datasets) do |format|
        format.html { render :partial => 'datasets' }
      end 
    end
  end
  
  def shared_properties
    result = catalogue_instance.api_shared_properties(params)
    if result.numeric && result.numeric.length > 1
      result.numeric.delete('gid')
      result.numeric.delete('id')
    end
    if result.string && result.string.length > 1
      result.string.delete('nid')
    end
    if result.empty? || (result.string.empty? && result.numeric.empty?)
      result = nil
    end    
    respond_with(result)
  end
  
  def feature_fields_by_type
    respond_with(catalogue_instance.api_feature_fields_by_type(params))
  end

  def feature_fields
    @feature_fields = catalogue_instance.api_feature_fields(params)
    respond_with(@feature_fields) do |format|
      format.html { render :partial => 'feature_fields' }
    end unless @feature_fields.empty?
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
  
  def external_datasets
    respond_with(catalogue_instance.api_external_datasets)
  end
  
  def external_layers
    dataset = catalogue_instance.dataset(params[:id])
    @layers = dataset.layers
    @layers.each_with_index do |layer, i|
      @layers[i]['colour'] = css_colour(i)
    end
    respond_with(@layers) do |format|
      format.html { render :partial => 'layers' }
    end    
  end
  
  def builder_response  
    @info_type = params[:info_type]
    @datasets = params[:datasets]
    @output = params[:output]
    
    if @info_type
      if @info_type == 'dataset'
        @response = catalogue_instance.api_dataset_raw(params[:datasets], params[:output])
      else
        feature_request = { :id => params[:datasets], :output => params[:output] }

        @bounds = ''
        if params[:north] && !params[:north].empty?
          @bounds = { :north => params[:north], :east => params[:east], :south => params[:south], :west => params[:west] }
          feature_request.merge(@bounds)
          @bounds = "&#{@bounds.to_query}"
        end

        if params[:source] == 'external'
          if params[:layer_north] && !params[:layer_north].empty?
            @bounds = { :north => params[:layer_north], :east => params[:layer_east], :south => params[:layer_south], :west => params[:layer_west] }
            feature_request.merge(@bounds)
            @bounds = "&#{@bounds.to_query}"
          end

          @layer = ''
          if params[:layer] && !params[:layer].empty?
            @layer = params[:layer]
            feature_request[:layer] = @layer
            @layer = "&layer=#{@layer}"
          end          
        end
        
        @extent = ''
        if params[:start] && !params[:start].empty?
          @extent = { :start => params[:start], :end => params[:end] }
          feature_request.merge(@extent)
          @extent = "&#{@extent.to_query}"
        end
        
        if params[:source] == 'external'
          if params[:filter_layer_start] && !params[:filter_layer_start].empty?
            @extent = { :start => params[:filter_layer_start], :end => params[:filter_layer_end] }
            feature_request.merge(@extent)
            @extent = "&#{@extent.to_query}"
          end
        else
          @properties = ''
          if params[:feature_fields] && !params[:feature_fields].empty?
            @properties = "&properties=#{CGI::escape(params[:feature_fields])}"
          end
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
