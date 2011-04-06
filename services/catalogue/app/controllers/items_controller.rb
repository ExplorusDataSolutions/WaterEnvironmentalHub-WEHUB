require 'zip/zip'

class ItemsController < ApplicationController

  protect_from_forgery :except => :create_meta_content
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]).first, :callback => params[:callback]
  end
  
  def download
    uuids = []
    if params[:id].match(/,/) != nil
      uuids = params[:id].split(/,/)
    else 
      uuids.push(params[:id])
    end
    
    format_type = 'json'
    if params[:format] != nil && params[:format] != 'undefined'
      format_type = params[:format].downcase
    end
    
    result = ''
    results = {}
    
    shape_factory = ShapeFactory.new
    feature_format_factory = FeatureFormatFactory.new
    
    uuids.each do |uuid|      
      dataset = Dataset.find_by_uuid(uuid).first
      if !dataset.nil?
        feature = dataset.feature
        begin
          if format_type == 'shape'              
            shape_files = shape_factory.find(feature)                  
            shape_files.each do |filename|
              file_data = IO.read("#{shape_factory.shape_directory}/#{filename}")
              results.store(filename, file_data)
            end
          else
            formatted_file = feature_format_factory.find(format_type, feature)
            results.store(formatted_file[:filename], formatted_file[:data])
          end
        rescue
        end        
      end
    end
    
    filename = "tmp/zips/#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'').gsub(/\+0000/,'').gsub(/0700/,'')}.zip"
    
    if results.count != 0
      Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
        zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
        results.each do |key, value|
          zip.get_output_stream("#{key}") { |f| f.puts value}  
        end      
      end
      
      send_file filename, :type => "application/zip"
    else
      raise ArgumentError, "No results could be found for #{params}"
    end
    
  end
  
  def create
    errors = {}
      
    spreadsheet = params[:spreadsheet]
    
    if errors.empty?
      filename = Rails.root.join('public', 'uploads', spreadsheet.original_filename)    
      File.open(filename, 'wb') do |file|
        file.write(spreadsheet.read)
      end

      dataset = Dataset.create(:name => params[:name], :description => params[:description], :feature_type => feature_type(params[:feature_type]))
      
      if dataset.valid?
        begin
          dataset.feature.create(spreadsheet.original_filename)
        rescue
          Dataset.destroy(dataset.id)
          
          errors.store('spreadsheet','Features could not be parsed from file')
        end
      else
        dataset.errors.each do |key, value|
          errors.store('dataset', "#{key} #{value}")
        end
      end
    end
    
    response = ''
    if !errors.empty?
      errors.each do |key, value|
        response = response + "#{value}"
      end
    else
      response = 'Success!'
    end
    
    render :text => response
  end
  
  def load_external_meta_content
    
    meta_content = FeatureMetaContent.find_by_source_uri(params[:source_uri])
    
    if meta_content.nil?
      dataset_params = {
        :name => params[:name],
        :description => params[:description],
        :feature_type => FeatureType.find_by_name('observation_data_dynamic'),
        :feature_source => FeatureSource.find_by_name(params[:source]),
      }

      dataset = Dataset.create(dataset_params)
      dataset.feature.create(params)
    else
      dataset = Dataset.find_by_uuid(meta_content.dataset_uuid)
      dataset.feature.create(params)
    end
        
    render :text => dataset.uuid.to_s
  end

  private
  
  def feature_type(feature_type)
    FeatureType.find_by_id(Integer(feature_type))
  end
  
  def feature_source(feature_source)
    FeatureSource.find_by_name(feature_source)
  end
    
end
