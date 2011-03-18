class ItemController < ApplicationController
  @catalogue
  
  def initialize
    @catalogue = CatalogueTranslator.new
  end

  def id
    render :json => @catalogue.find_by_id(params[:id])
  end
  
  def download
    redirect_to @catalogue.download_uri(params)
  end
  
end
