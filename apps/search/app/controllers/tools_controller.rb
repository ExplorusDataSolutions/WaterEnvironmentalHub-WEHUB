class ToolsController < ApplicationController

  respond_to :json, :xml
  
  def test
    render :layout => false
  end
  
  def index
    @breadcrumb = ['Tools']
    @main_menu = 'we_tools'
  end
  
  def chart
    @breadcrumb = ['Tools', 'Graph']
    @main_menu = 'we_tools'

    if params[:id]
      params[:ids] = [params[:id]]
    end
    
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def chart_feature
    result = catalogue_instance.api_feature(params)
    
    property = nil
    values = []
    result.features.each_with_index do |feature, i|
      if i == 0
        property = feature.properties.keys[0]
      end
      values.push(Float(feature.properties[property]))
    end

    respond_with(values)
  end
  
  def table
    @breadcrumb = ['Tools', 'Charts']
    @main_menu = 'we_tools'
  end
  
  def map
    @breadcrumb = ['Tools', 'Maps']
    @main_menu = 'we_tools'
    
    if params[:id]
      params[:ids] = [params[:id]]
    end
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def developers
    redirect_to :controller => 'api' and return
    
    @id = params[:id]
    @breadcrumb = ['Tools', 'Developers']
    @main_menu = 'we_tools'
  end
  
  def add_new_dataset
    @id = params[:hid_last_cnt]
    render :layout => false
  end
  
  def add_new_dataset_map
    @id = params[:hid_last_cnt]
    render :layout => false
  end

end
