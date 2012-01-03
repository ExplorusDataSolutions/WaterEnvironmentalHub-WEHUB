class ReviewsController < ApplicationController

  def index
    @reviews = catalogue_instance.find_reviews(params[:id])
    render :layout => false
  end
  
end
