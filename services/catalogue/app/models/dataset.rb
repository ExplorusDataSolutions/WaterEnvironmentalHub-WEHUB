require 'geoserver_translator.rb'
require 'uuidtools'

class Dataset < ActiveRecord::Base
  
  has_and_belongs_to_many :dataset_groups
  belongs_to :feature_type

  validates_presence_of :name, :description, :feature_type
  
  attr_accessor :feature
  
  scope :find_by_uuid, lambda {|uuid| { :conditions => { :uuid => uuid }}}  
  
  def before_create
    self.uuid = UUIDTools::UUID.timestamp_create().to_s
  end

  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid, :name => self.name, :description => self.description, :methodology => self.methodology }, 
      :group => self.dataset_groups.first.as_json(:exclude => self.uuid)
    }
  end
  
  def feature
    if @feature.nil?
      @feature = Feature.new(uuid, feature_type, name)
    end
    @feature
  end  
end
