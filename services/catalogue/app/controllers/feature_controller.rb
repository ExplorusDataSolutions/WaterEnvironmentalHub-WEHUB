class FeatureController < ApplicationController

  include DatasetHelper
  include VocabulatorHelper

  respond_to :json, :xml
    
  def update
    @dataset = Dataset.find_by_uuid(params[:id])  

    if is_owner(@dataset, params)
      @dataset.feature.update_feature(params[:feature_fields])
      save_feature_vocabulary(params[:vocabulary], params[:id])
    end
    
    expire_dataset_action_cache(@dataset.uuid)
    
    respond_with({ :uuid => @dataset.uuid }, :location => nil) and return
  end
    
end
