load 'enginey_translator.rb'

class UserController < ApplicationController

  include UserHelper
  
  respond_to :html, :only => [:sign_in, :groups, :register]
  respond_to :json, :except => :sign_in

  before_filter :verify_logged_in, :only => [:groups, :profile, :save, :password, :reviews]
  
  #Note: the if statement in the  caches_action works around a bug where Rails does not cache the content type
  caches_action :recently_viewed, :if => Proc.new { |c| c.headers["Content-Type"] = 'application/json; charset=UTF-8' }, :cache_path => :recently_viewed_key.to_proc, :expires_in => 30.minutes
  caches_action :saved_collection, :if => Proc.new { |c| c.headers["Content-Type"] = 'application/json; charset=UTF-8' }, :cache_path => :saved_collection_key.to_proc, :expires_in => 30.minutes
  caches_action :profile_snapshot, :cache_path => :profile_snapshot_key.to_proc, :expires_in => 30.minutes

  def recently_viewed_key
    "user/recently_viewed/#{user_id.to_s}"
  end
  
  def saved_collection_key
    "user/saved_collection/#{user_id.to_s}"
  end
  
  def profile_snapshot_key
    "user/profile_snapshot/#{user_id.to_s}"
  end
  
  def sign_in
    @breadcrumb     = ['Log in']
    @main_menu      = 'home'

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
          format.html { redirect_to redirected_from.nil? ? :root : redirected_from }
        end
      rescue Net::HTTPServerException => ex
        @user.errors.add_to_base('User could not be authenticated. Check your Login and Password.')
      end
    end
  end

  def register
    @user = User.new(params[:user])
    if request.post?
      begin
        if @user.valid?
          if params[:eula].nil?
            @user.errors.add_to_base('You must agree to the WEHUB\'s Privacy Statment and Terms of Use.')          
          else
            google_instance = GoogleTranslator.new
            if !google_instance.verify_recaptcha(request.remote_ip, params[:recaptcha_challenge_field], params[:recaptcha_response_field])
              @user.errors.add_to_base('Your CAPTCHA response could not be verified, please try again.') 
            else
              @user = socialnetwork_instance.register(params[:user])
              socialnetwork_instance.sign_out

              @user = socialnetwork_instance.sign_in(params[:user][:login], params[:user][:password])
              session[:user] = @user
              set_wehub_cookie(@user)
              
              respond_with(@user) do |format|
                format.html { redirect_to :root }
              end
            end
          end
        end
      rescue Exception => ex
        @user.errors.add_to_base('Username or email address have already been taken.')
      end
    else
      @breadcrumb     = ['Registration']
      @main_menu      = 'home'
    end    
  end
  
  def set_wehub_cookie(user)
    # the expires date should be sync'd with the session expiry
    cookies[:we_hub] = { :value => { :id => user.id, :display_name => user.display_name }.to_query, :expires => 7.days.from_now }
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

  def password
    @breadcrumb = ['Change Your Password']
    @main_menu = 'we_community'

    @user = User.new(nil)
    if request.post?
      response = {}
      if (params[:user][:password_old].blank? || params[:user][:password].blank? || params[:user][:password_confirmation].blank?)
        @user.errors.add_to_base('all password fields are required')
      elsif !(params[:user][:password] == params[:user][:password_confirmation])
        @user.errors.add_to_base('the new and confirmation passwords do not match')
      else
        begin
          response = socialnetwork_instance.password_update(params)      
        rescue
          
        end
        if response.include?('errors')      
          @user.errors.add_to_base(response.errors[0][1])
        else
          redirect_to :controller => 'user', :action => 'profile'
        end
      end
    end
  end
  
  def forgot
    @breadcrumb = ['Forgot Password']
  
    @user = User.new(nil)
    if request.post?
      socialnetwork_instance.password_reset(params[:user][:email])
      redirect_to :action => :sign_in
    end
  end
  
  def profile
    if request.post?
      begin
        socialnetwork_instance.profile_update(current_user.id, params)
        expire_fragment profile_snapshot_key
      rescue
        
      end
      render :text => params['value']
    else
      @profile = socialnetwork_instance.profile(params[:id].nil? ? current_user.id : params[:id])

      
      @breadcrumb = ["#{current_profile_logged_in? ? 'My' : @profile.name + '\'s'} Profile"]
      @main_menu = 'we_community'
    end    
  end 
    
  def profile_snapshot
    if !current_user.nil?
      @user_profile_groups = socialnetwork_instance.user_groups(current_user.id)
      @user_profile_datasets = catalogue_instance.find_datasets_by_user(current_user.id)
      @profile = socialnetwork_instance.profile(current_user.id)
    end
    render :partial => '/shared/user_profile_snapshot'
  end  
    
  def user_id
    logged_in? ? current_user.id : anonynmous_id
  end
  
  def recently_viewed
    if request.get?
      render :json => search_results_from_datasets(catalogue_instance.find_recently_viewed(user_id))
    end 
  end
  
  def modify_recently_viewed
    if request.post?
      if params[:id]
        catalogue_instance.add_recently_viewed(user_id, params[:id])
        expire_fragment recently_viewed_key
        redirect_to :action => :recently_viewed and return
      end
    end
    render :nothing => true and return
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
        redirect_to :action => :saved_collection and return
      end
    end
    render :nothing => true and return
  end
  
  def reviews
    uuids = catalogue_instance.find_user_reviews(current_user.id)
    if uuids
      uuids = uuids['strings']
    end
    
    render :json => uuids
  end
        
end
