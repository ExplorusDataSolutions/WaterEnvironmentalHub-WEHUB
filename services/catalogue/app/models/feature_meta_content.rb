class FeatureMetaContent < ActiveRecord::Base
  
  validates_presence_of :dataset_uuid, :keywords, :source_uri
  
end
