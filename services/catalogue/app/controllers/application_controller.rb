load 'enginey_translator.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def socialnetwork_instance
    if @socialnetwork.nil?
      @socialnetwork = EngineYTranslator.new(Rails.application.config.enginey_address, Rails.cache)
    end
    @socialnetwork
  end

end
