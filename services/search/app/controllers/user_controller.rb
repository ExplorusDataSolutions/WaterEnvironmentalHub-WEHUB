load 'enginey_translator.rb'

class UserController < ApplicationController
  layout :nil

  respond_to :html, :only => [:sign_in, :groups]
  respond_to :json, :except => :sign_in

  def socialnetwork
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new(session)
    end
    @socialnetwork
  end 

  def sign_in
    @user = User.new

    if request.post?
      begin
        @user = socialnetwork.sign_in(params[:user][:login], params[:user][:password])
        session[:user] = @user
        respond_with(@user) do |format|
          format.html { redirect_to :root }
        end
      rescue Net::HTTPServerException => ex
        @user.errors.add_to_base('User could not be authenticated. Check your Login and Password.')
      end
    end    
  end

  def sign_out
    socialnetwork.sign_out
    session[:user] = nil
    reset_session
    respond_with(:status => :ok)
  end

  def groups
    @groups = socialnetwork.groups(params[:user_id])
    respond_with(@groups) do |format|
      format.html { render :partial => 'groups' }
    end
  end

  def signed_in
    render :json => socialnetwork.logged_in?
  end

  def community
  end

  def login
    @breadcrumb     = ['Login...']
    @main_menu      = 'home'
    render :layout => 'application'
  end
  
  def register
    if request.post?
      @user = User.new
      begin
        @user = socialnetwork.register(params[:user])
        session[:user] = @user
        respond_with(@user) do |format|
          format.html { redirect_to :root }
        end
      rescue Net::HTTPServerException => ex
        @user.errors.add_to_base('User could not be authenticated. Check your Login and Password.')
      end
    else
      @breadcrumb     = ['Registration']
      @main_menu      = 'home'
      render :layout => 'application'
    end    
  end

end
