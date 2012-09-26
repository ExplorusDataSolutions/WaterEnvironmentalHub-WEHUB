class ToolsController < ApplicationController

  include ToolHelper

  respond_to :json, :xml

  caches_action :table_feature, :cache_path => Proc.new { |c| c.params }, :expires_in => 1.hours  
  
  def index
    @breadcrumb = ['Tools']
    @main_menu = 'we_tools'
  end
  
  def graph
    @breadcrumb = ['Tools', 'Graph']
    @main_menu = 'we_tools'

    add_param_ids_array(params)
    
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def chart_feature
    values = []
    property = nil    
    result = catalogue_instance.api_feature(params)

    if params[:type] == 'pie' || params[:type] == 'bar'
      bucket = {}
      result.features.each_with_index do |feature, i|
        property = feature.properties.keys[0]
        if bucket[feature.properties[property]]
          bucket[feature.properties[property]] = bucket[feature.properties[property]] + 1
        else
          bucket[feature.properties[property]] = 1
        end
      end
      
      bucket.each do |key, value|
        values.push([key, value])
      end
    else    
      result.features.each_with_index do |feature, i|
        if i == 0
          property = feature.properties.keys[0]
        end
        values.push(Float(feature.properties[property]))
      end
    end
    respond_with(values)

  end
  
  def table
    @breadcrumb = ['Tools', 'Tables']
    @main_menu = 'we_tools'

    add_param_ids_array(params)

    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def table_feature
    params[:output] = 'csv'
    if !params[:page]
      params[:page] = { :start => 0, :size => 100 }
    end

    @feature_csv = catalogue_instance.api_feature_raw(params)
    
    if !@feature_csv || @feature_csv.empty?
      render :status => :not_found and return
    end        
      
    render :partial => 'table_feature' and return
  end
  
  def map
    @breadcrumb = ['Tools', 'Maps']
    @main_menu = 'we_tools'
    
    add_param_ids_array(params)
    
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def developers
    redirect_to :controller => 'api' and return
    
    @id = params[:id]
    @breadcrumb = ['Tools', 'Developers']
    @main_menu = 'we_tools'
  end
  
  def compatibilities
    uuid = params[:id]
            
    respond_with(:supports => tool_compatibilities(uuid))
  end
  
end
