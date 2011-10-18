load 'enginey_translator.rb'

class UserController < ApplicationController
  respond_to :html, :only => [:sign_in, :groups, :register]
  respond_to :json, :except => :sign_in

  before_filter :verify_logged_in, :only => [:groups, :profile, :save]
  before_filter :fetch_user_groups, :fetch_user_datasets, :fetch_profile, :only => [:profile]
  
  #Note: the if statement in the  caches_action works around a bug where Rails does not cache the content type
  caches_action :recently_viewed, :if => Proc.new { |c| c.headers["Content-Type"] = 'application/json; charset=UTF-8' }, :cache_path => :recently_viewed_key.to_proc, :expires_in => 30.minutes
  caches_action :saved_collection, :if => Proc.new { |c| c.headers["Content-Type"] = 'application/json; charset=UTF-8' }, :cache_path => :saved_collection_key.to_proc, :expires_in => 30.minutes

  def recently_viewed_key
    "user/recently_viewed/#{user_id.to_s}"
  end
  
  def saved_collection_key
    "user/saved_collection/#{user_id.to_s}"
  end
  
  def sign_in
    @user = User.new(params[:user])
    if request.post?
      begin
        @user = socialnetwork_instance.sign_in(params[:user][:login], params[:user][:password])
        if @user && @user.api_key.empty?
          socialnetwork_instance.create_api_key
          socialnetwork_instance.sign_out
          @user = socialnetwork_instance.sign_in(params[:user][:login], params[:user][:password])
        end
        session[:user] = @user
        set_wehub_cookie(@user)

        respond_with(@user) do |format|
          format.html { redirect_to :root }
        end
      rescue Net::HTTPServerException => ex
        @user.errors.add_to_base('User could not be authenticated. Check your Login and Password.')
      end
    else
      @breadcrumb     = ['Login...']
      @main_menu      = 'home'
      render :layout => 'application'
    end    
  end

  def register
    @user = User.new(params[:user])
    if request.post?
      begin
        if @user.valid?
          @user = socialnetwork_instance.register(params[:user])
          session[:user] = @user
          set_wehub_cookie(@user)
          
          respond_with(@user) do |format|
            format.html { redirect_to :root }
          end
        end
      rescue Net::HTTPServerException => ex
        @user.errors.add_to_base('User could not be authenticated. Check your Login and Password')
      end
    else
      @breadcrumb     = ['Registration']
      @main_menu      = 'home'
    end    
  end

  def set_wehub_cookie(user)
    cookies[:we_hub] = { :value => { :id => user.id, :display_name => user.display_name }.to_query, :expires => 1.year.from_now }
  end
  
  def delete_wehub_cookie
    cookies.delete :we_hub
  end
  
  def sign_out
    socialnetwork_instance.sign_out
    session[:user] = nil
    reset_session
    delete_wehub_cookie
    redirect_to :root
  end

  def groups
    @groups = socialnetwork_instance.user_groups(params[:user_id])
    respond_with(@groups) do |format|
      format.html { render :partial => 'groups' }
    end
  end

  def signed_in
    render :json => socialnetwork_instance.logged_in?
  end

  def profile
    if request.post?
      begin
        socialnetwork_instance.profile_update(current_user.id, params)
      rescue
        
      end
      render :text => params['value']
    else
      @profile = socialnetwork_instance.profile(params[:id].nil? ? current_user.id : params[:id])
      @breadcrumb = ['My Profile']
      @main_menu = 'we_community'
    end    
  end

  def user_id
    logged_in? ? current_user.id : anonynmous_id
  end
  
  def recently_viewed
    if request.get?
debugger    
      render :json => search_results_from_datasets(catalogue_instance.find_recently_viewed(user_id))
    end 
  end
  
  def modify_recently_viewed
    if request.post?
      if params[:id]
        catalogue_instance.add_recently_viewed(user_id, params[:id])
        expire_fragment recently_viewed_key
      end
    end
    render :nothing => true
  end
  
  def saved_collection
    if logged_in?
      render :json => search_results_from_datasets(catalogue_instance.find_saved(current_user.id)) and return
    else
      render :status => :forbidden and return
    end
  end

  def modify_collection
    if request.post?
      if params[:ids] && logged_in?
        catalogue_instance.user_collections(current_user.id, params[:ids], params[:modifier])
        expire_fragment saved_collection_key
      end
    end
    render :nothing => true
  end
  
  def befriend
    if params[:id]
      socialnetwork_instance.friend_add(params[:id])
      redirect_to :controller => 'community', :action => 'friends'
    end
  end

  def unfriend
    if params[:id]
      socialnetwork_instance.friend_remove(current_user.id, params[:id])
      redirect_to :controller => 'community', :action => 'friends'
    end
  end
        
end
