class ItemsController < ApplicationController
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]).first
  end
  
end
