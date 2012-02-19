class ApiController < ApplicationController

  include DatabaseHelper
  
  caches_action :datasets, :is_feature_external, :dataset, :feature_types, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours

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
    uuids = params[:ids].split(',') unless !params[:ids]
    
    @datasets = []
    if feature_type_id
      results = ActiveRecord::Base.connection.execute("SELECT uuid, name FROM datasets WHERE feature_type_id = #{feature_type_id} ORDER BY name")
      
      results.each do |result|
        @datasets.push(Dataset.new(:uuid => result['uuid'], :name => result['name'], :feature_source => FeatureSource.new(:name => 'light')))
      end
    elsif uuids
      uuids.each do |uuid|
        @datasets.push(Dataset.find_by_uuid(uuid))
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
  
  def shared_properties
    uuids = params[:ids].split(',') unless !params[:ids]

    common_terms_with_types = {}
    uuids.each_with_index do |uuid, i|
      dataset = Dataset.find_by_uuid(uuid)
      feature = dataset.feature unless !dataset
      if !feature.nil? && !feature.is_data_source_external?
        fields_with_type = feature.feature_fields_by_type
        common_terms_with_types.merge!(fields_with_type) if i == 0
        fields_with_type.each do |key, value|
          common_terms_with_types[key] = common_terms_with_types[key] & value
        end
      end
    end unless uuids.length < 2

    respond_with(common_terms_with_types)
  end
  
  def feature_fields_by_type
    dataset = Dataset.find_by_uuid(params[:id])
    feature = dataset.feature unless !dataset
    respond_with(feature.feature_fields_by_type)
  end
end
