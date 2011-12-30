class ReviewsController < ApplicationController
  
  respond_to :json, :xml
 
  def index
    respond_with(UserReview.find_all_by_uuid_order_by_date_with_limit(params[:id]))  
  end
  
  def show
    respond_with(UserReview.find_by_uuid(params[:id]))
  end
  
  def create    
    respond_with(UserReview.create(params[:review]))
  end
  
end
