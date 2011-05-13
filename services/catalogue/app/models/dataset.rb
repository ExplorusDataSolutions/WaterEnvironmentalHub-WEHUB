require 'geoserver_translator.rb'
require 'uuidtools'

class Dataset < ActiveRecord::Base
  
  has_and_belongs_to_many :dataset_groups
  belongs_to :feature_type
  belongs_to :feature_source
  belongs_to :owner
  has_one :author

  validates_presence_of :name, :description, :feature_type
  
  before_create :generate_uuid
  
  attr_accessor :feature
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.timestamp_create().to_s
  end

  def feature
    if @feature.nil?
      @feature = Feature.new(uuid, feature_source, name)
    end
    @feature
  end  
  
  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid, :name => self.name, :description => self.description }, 
      :group => self.dataset_groups.first.as_json(:exclude => self.uuid)
    }
  end
   
end
