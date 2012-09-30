class ToolsController < ApplicationController

  respond_to :json, :xml
  
  def compatibilities
    response = false
  
    if request.post?
      compatibility = ToolCompatibility.find_or_initialize_by_dataset_uuid(params[:id])
      
      if compatibility
        supported_tools = params[:supported_tools]
        if supported_tools && supported_tools.is_a?(Array) && !supported_tools.empty?
          response = compatibility.update_attributes({ :compatibilities => supported_tools })
        end
      end
    end
    
    respond_with({:status => response}, :location => nil)
  end
end
