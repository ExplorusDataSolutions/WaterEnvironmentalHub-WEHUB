load 'enginey_translator.rb'

class UserController < ApplicationController

  respond_to :html, :only => :sign_in
  respond_to :json, :except => :sign_in

  def socialnetwork
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new
    end
    @socialnetwork
  end 

  def sign_in
    if request.post?
      begin
        user = socialnetwork.sign_in(params[:user][:login], params[:user][:password])
        respond_with(user) do |format|
          if !user.nil?
            :notice => "User was successfully logged in"
            format.html { redirect_to :root }
          else

          end
        end
      rescue Net::HTTPServerException => ex
        :notice => "User could not be logged in"
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
