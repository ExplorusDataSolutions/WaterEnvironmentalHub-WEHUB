load 'enginey_translator.rb'

class UserController < ApplicationController
  layout nil

  respond_to :html, :only => :sign_in
  respond_to :json, :except => :sign_in

  def socialnetwork
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new
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
    reset_session
    respond_with(:status => :ok)
  end

  def index
    respond_with(session[:user])
  end
end
