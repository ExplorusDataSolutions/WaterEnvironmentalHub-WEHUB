class GeonetworkController < ApplicationController
  
  include DatasetHelper
  
  respond_to :xml
  
  def metadata    
    @dataset = Dataset.find_by_uuid(params[:id])
    
    #Geonetwork won't search between round brackets so we're added a space so the terms are searchable
    dataset_name = @dataset.name
    if dataset_name && dataset_name.match(/\(|\)/)
      dataset_name.gsub!(/\(/,'( ')
      dataset_name.gsub!(/\)/,' )')
    end
    @dataset.name = dataset_name
    
    @related_datasets = []
    
    if @dataset.dataset_groups.count > 0
      @dataset.dataset_groups.first.datasets.each do |d|
        if d.uuid != params[:id]
          @related_datasets.push(d)
        end
      end
    end    
    
    feature = @dataset.feature
    @keywords = feature.keywords    
    @bounding_box = feature.bounding_box
    @temporal_extent = feature.temporal_extent
    
    review = UserReview.find_by_uuid(params[:id])
    @review_summary = review.summary unless review.nil?
  end
  
  def info
    @dataset = Dataset.find_by_uuid(params[:id])
  end
  
  def mef_import_list
    uuids = []
    datasets = Dataset.all.sort_by { |d| d.created_at }
    datasets.each do |dataset|
      if public_dataset?(dataset)
        uuids.push(dataset.uuid)
      end
    end
    
    render :xml => uuids
  end
  
  def group
    @feature_type = FeatureType.find_by_name(params[:id])
  end
  
  def group_import_list
    ids = {}
    FeatureType.all.each do |feature|
      ids.store(feature.name, feature.id.to_s)
    end
    render :xml => ids
  end
end
