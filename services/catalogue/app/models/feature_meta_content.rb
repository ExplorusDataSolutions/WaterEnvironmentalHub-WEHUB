class FeatureMetaContent < ActiveRecord::Base
  
  validates_presence_of :dataset_uuid, :keywords, :source_uri
  
  has_many :layers, :class_name => 'FeatureMetaLayer', :dependent => :destroy
  accepts_nested_attributes_for :layers
  
end
