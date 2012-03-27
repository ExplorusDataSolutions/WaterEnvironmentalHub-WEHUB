class DatasetsController < ApplicationController

  respond_to :json, :xml
  
  before_filter :verify_logged_in

  caches_action :show, :cache_path => :datasets_key.to_proc, :expires_in => 30.minutes
  
  def new
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'
    
    @dataset = params[:dataset] ? Hashie::Mash.new(params[:dataset]) : Hashie::Mash.new({:source => nil, :author => nil})  
  end
  
  def create
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'

    @dataset = params[:dataset] ? Hashie::Mash.new(params[:dataset]) : Hashie::Mash.new({:source => nil, :author => nil})  
    
    expire_fragment datasets_key

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
          response.merge!({ :callback => (url_for :controller => 'datasets', :action => 'show', :anchor => 'mine', :id => response[:uuid]) })
          response.delete(:uuid)
        end
      rescue Exception => e
        respond_with({ :exception => e.to_s, :status => 500 }, :location => nil) and return
      end
    else
      response[:errors] = [['filename', 'file can\'t be blank']]
    end

    respond_with(response, :location => nil) do |format|
      format.html { 
        if response.key?(:errors)
          flash[:errors] = response[:errors]
          render 'new'
        else
          redirect_to response[:callback]
        end
      }
    end
  end  

  def datasets_key
    "datasets/user/#{current_user.id}"
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

end
