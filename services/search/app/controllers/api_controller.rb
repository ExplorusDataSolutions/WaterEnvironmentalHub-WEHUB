class ApiController < ApplicationController

  respond_to :json, :xml

  respond_to :html, :only => ['builder_result']
  
  def builder
    @breadcrumb = ['API']
    @feature_types = catalogue_instance.api_feature_types
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
   
end
