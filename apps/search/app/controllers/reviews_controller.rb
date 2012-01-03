class ReviewsController < ApplicationController

  before_filter :verify_logged_in, :only => [:create]  
  
  def index
    @reviews = catalogue_instance.find_reviews(params[:id])
    render :layout => false
  end
  
  def new
    render :partial => 'new'
  end
  
  def create  
    review = params[:review]
    review.merge!(:user_id => current_user.id)
    review.merge!(:uuid => params[:id])
    
    response = catalogue_instance.create_review(review)

    render :nothing => true, :status => (response.nil? ? 500 : :ok)
  end
end
