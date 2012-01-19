require 'zip/zip'

class ItemsController < ApplicationController

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

    uploaded_file = params[:filename]

    if errors.empty?
      filename = sanitize_filename(uploaded_file.original_filename)
      filename_and_path = Rails.root.join('public', 'uploads', filename)
      File.open(filename_and_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end
      
      dataset = Dataset.create(dataset_params(params))
      
      if dataset.valid?
        owner = owner(params[:owner])
        author = author(params[:author])
        creative_commons_license = creative_commons_license(params[:creative_commons_license])
        begin
          dataset.feature.create(filename)
          dataset.owner = owner 
          dataset.author = author 
          dataset.creative_commons_license = creative_commons_license
          dataset.save
        rescue Exception => e
          Dataset.destroy(dataset.id)
          Owner.destroy(owner.id) unless owner.nil?
          Author.destroy(author.id) unless author.nil?
          
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
      dataset_params = params
      params.merge!(:feature_type => FeatureType.find_by_name('observation_data_dynamic'))
      params.merge!(:feature_source => FeatureSource.find_by_name(params[:feature_source]))

      dataset = Dataset.create(dataset_params)
      if !dataset.errors.empty?
        render :text => dataset.errors, :status => 500 and return
      end

      dataset.feature.create(params)
    else
      dataset = Dataset.find_by_uuid(meta_content.dataset_uuid)
      dataset.update_attributes(params)
      dataset.feature.create(params)
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

  def creative_commons_license(params)
    (params.nil? || params.empty? || params == 'none') ? nil : CreativeCommonsLicense.find_by_name(params)
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
  
  def sanitize_filename(filename)
    filename.strip.tap do |name|
      # NOTE: File.basename doesn't work right with Windows paths on Unix
      # get only the filename, not the whole path
      name.sub! /\A.*(\\|\/)/, ''
      # Finally, replace all non alphanumeric, underscore
      # or periods with underscore
      name.gsub! /[^\w\.\-]/, '_'
    end
  end
    
end
