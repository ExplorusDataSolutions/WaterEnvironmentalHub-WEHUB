require 'zip/zip'

class ItemsController < ApplicationController

  include DatasetHelper
  
  caches_action :index, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours

  respond_to :json, :xml

  protect_from_forgery :except => :create
  
  def index
    respond_with(Dataset.find_by_uuid(params[:id])) 
  end
  
  def download
    directory ="#{Rails.root}/tmp/zips/"
    if params[:filename]
      send_file "#{directory}#{params[:filename].match(/\w+.zip/)[0]}", :type => "application/zip" and return
    end

    errors = []

    uuids = []
    if params[:ids].match(/,/) != nil
      uuids = params[:ids].split(/,/)
    else 
      uuids.push(params[:ids])
    end
    
    format_type = 'json'
    if params[:format] != nil && params[:format] != 'undefined'
      format_type = params[:format].downcase
    end
    
    result = ''
    results = []
    
    shape_factory = ShapeFactory.new("#{Rails.root}/tmp/shapes", "#{Rails.root}/tmp/zips")
    feature_format_factory = FeatureFormatFactory.new
    
    uuids.each do |uuid|      
      dataset = Dataset.find_by_uuid(uuid)
      if !dataset.nil?
        feature = dataset.feature
        begin
          if format_type == 'shape'          
            shape_files = shape_factory.find(feature)   
            shape_files.each do |filename|
              file_data = IO.read("#{shape_factory.shape_directory}/#{filename}")
              results.push(:filename => filename, :id => uuid, :data => file_data)
            end
          else    
            formatted_file = feature_format_factory.find(format_type, feature, params)
            results.push(:filename => formatted_file[:filename], :id => uuid, :data => formatted_file[:data])
          end
        rescue Exception => e        
          logger.error e
          errors.push(e.message)
        end        
      end
    end

    if results.count != 0
      unique_id = Time.now.to_s.scan(/\w+/).join.gsub(/\+0000|0600/,'')
      if results.count == 1
        filename = "#{directory}WEHub_#{results[0][:filename][0,results[0][:filename].index('.')]}_#{unique_id}.zip"
      else
        filename = "#{directory}WEHub_#{unique_id}.zip"
      end
      Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
        read_me_text = "Thanks for visiting The Water and Environmental Hub (http://waterenvironmentalhub.ca).\n\nYou've downloaded the following datasets:\n"
        results.each do |result|
          read_me_text += "\thttp://waterenvironmentalhub.ca/catalogue/details/#{result[:id]}\n"
        end       
        zip.get_output_stream("README") { |f| f.puts read_me_text }
        results.each do |result|
          zip.get_output_stream("#{result[:filename]}") { |f| f.puts result[:data]}  
        end
      end
            
      render :json => { :success => 'true', :errors => errors, :filename => filename.gsub(directory,'') }
    else
      render :json => { :failure => 'true', :errors => errors }
    end
  end
  
  def create
    errors = {}
    if errors.empty?

      dataset = Dataset.create(dataset_params(params))
      
      if dataset.valid?
        begin
          dataset.transaction do
            dataset.feature.create({ :filename => params[:filename][:path] })
            dataset.save        
          end
        rescue Exception => e 
          dataset.destroy
          errors.store('exception', e.to_s)
        end
      else
        dataset.errors.each do |key, value|
          errors.store('dataset', "#{key} #{value}")
        end
      end      
    end
    
    if !errors.empty?
      respond_with({ :errors => errors }, :location => nil) and return
    end
    
    respond_with({ :uuid => dataset.uuid }, :location => nil) and return
  end
  
  def load_external_meta_content
    feature_params = params[:dataset][:feature]
    feature_params.merge!(:layers_attributes => feature_params[:layers])
    feature_params.delete(:layers)
    
    meta_content = FeatureMetaContent.find_by_source_uri(feature_params[:source_uri])
    
    if meta_content.nil?
      dataset_params = params[:dataset]
      dataset_params.merge!(:feature_type => FeatureType.find_by_name('observation_data_dynamic'))
      dataset_params.merge!(:feature_source => FeatureSource.find_by_name(dataset_params[:feature_source]))
      dataset_params.delete(:feature)

      dataset = Dataset.create(dataset_params)
      if !dataset.errors.empty?
        render :text => dataset.errors, :status => 500 and return
      end

      dataset.feature.create(feature_params)
    else
      dataset = Dataset.find_by_uuid(meta_content.dataset_uuid)

      dataset_params = params[:dataset]
      dataset_params.delete(:uuid)
      dataset_params.delete(:feature_period)
      dataset_params.delete(:feature_source)
      dataset_params.delete(:feature)
      
      dataset.update_attributes(dataset_params)
      dataset.feature.create(feature_params)
    end

    render :text => dataset.uuid
  end

  def list_geoserver_content
    uuids = []
    feature_source = FeatureSource.find_by_name('geoserver')
    Dataset.find_all_by_feature_source_id(feature_source.id).each { |d| uuids.push(d.uuid) }
    respond_with(uuids)
  end
  
  def load_geoserver_content
    uuid = params[:uuid]
    if !uuid.scan(/^([\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12})$/).empty?
      dataset = Dataset.find_by_uuid(uuid)
      dataset_params = {
        :uuid => uuid,
        :name => params[:name],
        :description => params[:description],
        :feature_type => FeatureType.find_by_name('base_data_static'),
        :feature_source => FeatureSource.find_by_name('geoserver'),
      }
      
      dataset_group = find_dataset_group(params[:name])
      if !dataset_group.nil?
        dataset_params[:dataset_groups] = [dataset_group]
      end

      if dataset.nil?
        dataset = Dataset.create(dataset_params)
      else       
        dataset.update_attributes(dataset_params)
        dataset.save
      end

      render :text => dataset.uuid and return
    end
    render :text => uuid, :status => 500 and return
  end

  private
  
  def find_dataset_group(name)
    DatasetGroup.all.each do |group|
      if !name.scan(/#{group.name}/i).empty? 
        return group
      end
    end
    nil
  end
      
end
