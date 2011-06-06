require 'zip/zip'

class ItemsController < ApplicationController

  protect_from_forgery :except => :create
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]), :callback => params[:callback]
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
      dataset = Dataset.find_by_uuid(uuid)
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
        rescue Exception => e
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

    uploaded_file = params[:filename]

    if errors.empty?
      filename = Rails.root.join('public', 'uploads', uploaded_file.original_filename)    
      File.open(filename, 'wb') do |file|
        file.write(uploaded_file.read)
      end
      
      dataset = Dataset.create(dataset_params(params))
      
      if dataset.valid?
        owner = owner(params[:owner])
        author = author(params[:author])
        begin
          dataset.feature.create(uploaded_file.original_filename)
          dataset.owner = owner
          dataset.author = author
          dataset.save
        rescue Exception => e
          Dataset.destroy(dataset.id)
          Owner.destroy(owner.id)
          Author.destroy(author.id)
          
          errors.store('spreadsheet', e)
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
      if request.referer.scan(/datasets\/create/).count == 1
          redirect_to "#{request.referer.slice(0..request.referer.rindex('/'))}success" and return
      end
      render :xml => dataset and return
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
      if !dataset.errors.empty?
        render :text => dataset.errors, :status => 500 and return
      end

      dataset.feature.create(params)
    else
      dataset = Dataset.find_by_uuid(meta_content.dataset_uuid)
      dataset.feature.create(params)
    end

    render :text => dataset.uuid
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

  def author(params)

    first = ''
    last = ''
    email = params[:email]
    if params.key?('name')
      name = params[:name]
      if name.scan(' ').count > 0
        names = name.split(' ')
        (0..names.count-2).each do |i|
          first << "#{names[i]} "
        end
        first.chop!
        last = names[names.count-1]
      else
        last = name
      end
    end

    if !(first.empty? || last.empty? || email.empty?)
      return Author.create(:first_name => first, :last_name => last, :email => email)
    else 
      return nil
    end
  end
  
  def feature_period(params)
    if params.key?('feature_period')
      params[:feature_period]
    else
      "#{params[:feature_period_start]} - #{params[:feature_period_end]}"
    end
  end

  def owner(owner)
    owner.delete_if {|key, value| key == "group_id" && (value == "0" || value == "") }
    Owner.create(owner)
  end

  def dataset_params(params)
    dataset_params = params[:dataset]

    dataset_params[:feature_period] = feature_period(dataset_params)
    dataset_params.delete_if {|key, value| key == 'feature_period_start' || key == 'feature_period_end' }
    dataset_params[:feature_type] =  FeatureType.find_by_name(dataset_params[:feature_type])
    dataset_params[:feature_source] = FeatureSource.find_by_name('catalogue')

    dataset_params
  end
    
end
