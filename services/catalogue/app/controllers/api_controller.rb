class ApiController < ApplicationController

  respond_to :json, :xml
  
  def feature_types
    @feature_types = FeatureType.where("name = ? OR name = ?", 'base_data_static', 'observation_data_dynamic')
    
    respond_with(@feature_types, :dasherize => false)
  end
  
  def is_feature_external
    dataset_id = params[:id]

    if dataset_id
      feature_source_id = ActiveRecord::Base.connection.execute("SELECT feature_source_id FROM datasets WHERE uuid = '#{dataset_id}'")
      if feature_source_id
        feature_source_id = feature_source_id[0]['feature_source_id'].to_i
      end
      respond_with(feature_source_id == 3 || feature_source_id == 4)
    end    
  end
  
  def datasets
    feature_type_id = params[:feature_type_id]
    
    if feature_type_id
      results = ActiveRecord::Base.connection.execute("SELECT uuid, name FROM datasets WHERE feature_type_id = #{feature_type_id} ORDER BY name")
      
      @datasets = []
      results.each do |result|
        @datasets.push(Dataset.new(:uuid => result['uuid'], :name => result['name'], :feature_source => FeatureSource.new(:name => 'light')))
      end
    end  
    
    respond_with(@datasets)
  end
  
  def dataset
    dataset_id = params[:id]

    if dataset_id
      @dataset = Dataset.find_by_uuid(dataset_id)
    end

    respond_with(@dataset)
  end
  
  def feature  
    if params[:id] && params[:output]
      dataset = Dataset.find_by_uuid(params[:id])
      if dataset && dataset.feature
        feature_format_factory = FeatureFormatFactory.new
        feature = feature_format_factory.find(params[:output], dataset.feature, params)
        if feature
          @data = feature[:data]
        end
      end
    end
    
    # returns results in text format b/c some of our data results in invalid XML and JSON
    render :text => @data
  end
  
end
