load 'enginey_translator.rb'

class UserController < ApplicationController
  respond_to :html, :only => [:sign_in, :groups, :register]
  respond_to :json, :except => :sign_in

  before_filter :verify_logged_in, :only => [:groups, :profile, :save]
  before_filter :fetch_user_groups, :fetch_user_datasets, :fetch_profile, :only => [:profile]

 
  def sign_in
    @user = User.new(params[:user])
    if request.post?
      begin
        @user = socialnetwork_instance.sign_in(params[:user][:login], params[:user][:password])
        session[:user] = @user
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

  def sign_out
    socialnetwork_instance.sign_out
    session[:user] = nil
    reset_session
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
      @profile = socialnetwork_instance.profile(current_user.id)
      @breadcrumb = ['My Profile']
      @main_menu = 'we_community'
    end    
  end
  
  def recently_viewed
    if request.post?
      if params[:id]
        catalogue_instance.add_recently_viewed(current_user.id, params[:id])
        render :nothing => true
      end
    end 
  end
  
  def save
    if request.post?
      if params[:ids]
        catalogue_instance.add_saved(current_user.id, params[:ids])
        render :nothing => true
      end
    end
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
