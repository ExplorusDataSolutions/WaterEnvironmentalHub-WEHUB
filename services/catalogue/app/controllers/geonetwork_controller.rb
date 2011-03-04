class GeonetworkController < ApplicationController
  
  respond_to :xml
  
  def metadata
    @dataset = Dataset.find_by_uuid(params[:id]).first
    
    @related_datasets = []
    @dataset.dataset_groups.first.datasets.each do |d|
      if d.uuid != params[:id]
        @related_datasets.push(d)
      end
    end
    
    @keywords = Dataset.keywords(params[:id])
  end
  
  def info
    @dataset = Dataset.find_by_uuid(params[:id]).first
  end
  
  def mef_import_list
    uuids = []
    Dataset.all.each do |dataset|
      uuids.push(dataset.uuid)
    end
    
    render :xml => uuids
  end
end
