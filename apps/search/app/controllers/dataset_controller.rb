class DatasetController < ApplicationController

  respond_to :json, :xml
  
  before_filter :verify_logged_in

  caches_action :show, :cache_path => :dataset_key.to_proc, :expires_in => 30.minutes

  def dataset_key
    "dataset/user/#{current_user.id}"
  end
  
  def search_dataset_key(uuid=params[:id])
    "search_dataset_#{uuid}"
  end
  
  def profile_snapshot_key
    "user/profile_snapshot/#{current_user.id}"
  end
  
  def new
    @breadcrumb = ['Community', 'Datasets', 'New']
    @main_menu = 'we_community'
    
    @dataset = params[:dataset] ? Hashie::Mash.new(params[:dataset]) : Hashie::Mash.new({:source => nil, :author => nil})  
  end
  
  def edit
    @breadcrumb = ['Community', 'Datasets', 'Edit']
    @main_menu = 'we_community'
  
    @dataset = catalogue_instance.dataset(params[:id])
    @dataset.description = @dataset.description_with_html
    
    expire_fragment dataset_key
    expire_fragment search_dataset_key(@dataset.id)
    expire_fragment profile_snapshot_key  
            
    params['creative_commons_license'] = @dataset.creative_commons_license    
  end

  def destroy
    @dataset = catalogue_instance.dataset(params[:id])
    response = catalogue_instance.dataset_destroy(current_user.id, params[:id])

    expire_fragment dataset_key
    expire_fragment search_dataset_key
    expire_fragment profile_snapshot_key    
        
    if response.key?(:errors)
      flash[:errors] = response[:errors].values
    end
    
    flash[:message] = "Dataset <strong>#{@dataset.name}</strong> has been deleted."

    redirect_to :action => 'show', :anchor => 'mine'
  end
  
  def update
    params[:dataset] = map_from_form(params[:dataset])     
    params['creative_commons_license'] = params[:dataset][:creative_commons_license]

    @dataset = Hashie::Mash.new(params[:dataset])

    expire_fragment dataset_key
    expire_fragment search_dataset_key(@dataset.id)
    expire_fragment profile_snapshot_key    
    
    response = catalogue_instance.dataset_update(current_user.id, params[:dataset])

    if request.xhr?
      render :json => json_response(response, (url_for :action => 'show', :anchor => 'mine', :id => response[:uuid])) and return
    else
      if response.key?(:errors)
        flash[:errors] = response[:errors].values      
        render 'edit'
      else    
        redirect_to :action => 'show', :anchor => 'mine', :id => response[:uuid] and return
      end
    end
  end
    
  def create
    #ToDo: wrangle this method to be similar to update method (form translation done in search app, not on catalogue service)
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'

    @dataset = params[:dataset] ? Hashie::Mash.new(params[:dataset]) : Hashie::Mash.new({:source => nil, :author => nil})  
    
    expire_fragment dataset_key
    expire_fragment profile_snapshot_key    
    
    uploaded_file = params[:filename]

    response = {}
          
    if uploaded_file
      filename = sanitize_filename(uploaded_file.original_filename)

      filename_and_path = Rails.root.join('public', 'uploads', filename)
      File.open(filename_and_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      params[:filename] = filename_and_path
                      
      begin
        response = catalogue_instance.create(params)
        
        if response && response.key?(:uuid)        
          response.merge!({ :callback => (url_for :controller => 'feature', :action => 'edit', :anchor => 'my-feature', :id => response[:uuid], :uploader => 'success') })
          response.delete(:uuid)
        end
      rescue Exception => e
        respond_with({ :exception => e.to_s, :status => 500 }, :location => nil) and return
      end
    else
      response[:errors] = {:filename => 'file can\'t be blank'}
    end

    respond_with(response, :location => nil) do |format|
      format.html { 
        if response.key?(:errors)
          flash[:errors] = response[:errors].values
          render 'new'
        else
          redirect_to response[:callback]
        end
      }
    end
  end    
  
  def show
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'

    @my_datasets = my_datasets
    @friend_datasets = friend_datasets
    @group_datasets = group_datasets
  end

  def markitup_preview
    render :layout => false
  end

  private 

  def json_response(response, callback)
    json = {}
    json.store(:errors, response[:errors]) if response.key?(:errors)
    json.store(:callback, callback) if !response.key?(:errors)
    json
  end

  def friend_datasets
    friend_ids = []
    friends = socialnetwork_instance.friends(current_user.id)
    friends.each { |friend| friend_ids.push(friend.id) } unless friends.nil?
    if !friend_ids.empty?
      catalogue_instance.find_datasets_by_user(friend_ids.join(','))
    end
  end

  def group_datasets
    group_ids = []
    groups = socialnetwork_instance.user_groups(current_user.id)
    groups.each { |group| group_ids.push(group.id) } unless groups.nil?
    if !group_ids.empty?
      catalogue_instance.find_datasets_by_group(group_ids.join(','))
    end
  end

  def my_datasets
    catalogue_instance.find_datasets_by_user(current_user.id)
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
  
  def map_from_form(params)
    if params[:feature_period_start]
      params[:feature_period] = "#{params[:feature_period_start]} - #{params[:feature_period_end]}"
      params.delete(:feature_period_start)
      params.delete(:feature_period_end)      
    end
    if params[:permissions] && params[:permissions][:group] == true.to_s
      params[:owner] = params[:permissions][:owner]
    else
      params[:owner] = params[:permissions][:owner]
      params[:owner][:group_id] = nil
    end
    params.delete(:permissions)

    params
  end

end
