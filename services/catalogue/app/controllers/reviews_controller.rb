class ReviewsController < ApplicationController
  
  respond_to :json, :xml
 
  def index
    page_size = (!params[:page_size] || params[:page_size].to_i > 100) ? 100 : params[:page_size].to_i
    page = (!params[:page] || params[:page].to_i <= 0 ) ? 1 : params[:page].to_i

    @reviews = UserReview.paginate(:page => page, :per_page => page_size).order('id DESC')
    
    respond_with(@reviews)
  end
  
  def show  
    @review = UserReview.find_by_uuid(params[:id])
    respond_with(@review)
  end
  
  def create
    @review = UserReview.create(params[:review])
    respond_with(@review, :location => reviews_url)
  end
  
  def summary
    review = UserReview.find_by_uuid(params[:id])
    respond_with(review.summary)
  end
  
end
