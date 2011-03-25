require 'zip/zip'

class ItemsController < ApplicationController

  protect_from_forgery :except => :create
  
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
    if params[:format] != nil
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
    spreadsheet = params[:spreadsheet]
    if spreadsheet.nil?
      raise ArgumentError, "File required"
    end

    if spreadsheet.original_filename.match(/(\.xls|\.xlsx|\.ods)$/).nil?
      raise ArgumentError, "Unsupported file type"
    end        
    filename = Rails.root.join('public', 'uploads', spreadsheet.original_filename)    
    File.open(filename, 'wb') do |file|
      file.write(spreadsheet.read)
    end
  
    dataset = Dataset.create(:name => params[:name], :description => params[:description], :feature_type => feature_type, :dataset_groups => dataset_groups)
    
    if dataset.valid?
      begin
        dataset.feature.create(spreadsheet.original_filename)
      rescue
        Dataset.destroy(dataset.id)
        raise ArgumentError, "Feature could not be created"
      end
    else
      raise ArgumentError, dataset.errors
    end
    
    render :json => dataset
  end

  private
  
  def feature_type
    feature_type_id = ''
    params[:feature_type].each do |key, value|
      feature_type_id << key
    end
    FeatureType.find_by_id(feature_type_id)    
  end
  
  def dataset_groups
    dataset_groups = []
    params[:dataset_groups].each do |key, value|
      dataset_groups.push(DatasetGroup.find_by_id(Integer(key)))
    end
    dataset_groups
  end
  
end
