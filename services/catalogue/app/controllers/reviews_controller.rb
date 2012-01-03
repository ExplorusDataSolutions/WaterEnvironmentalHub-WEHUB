class ReviewsController < ApplicationController
  
  respond_to :json, :xml
 
  def index
    @review = UserReview.find_all_by_uuid_order_by_date_with_limit(params[:id])
    respond_with(@review)  
  end
  
  def show  
    @review = UserReview.find_by_uuid(params[:id])
    respond_with(@review)
  end
  
  def create
    @review = UserReview.create(params[:review])
    respond_with(@review, :location => reviews_url)
  end
  
end
