class ReviewsController < ApplicationController

  include ReviewHelper
  
  before_filter :verify_logged_in, :only => [:create]  

  def dashboard
    @review_summary = catalogue_instance.find_review_summary(params[:id])

    render :partial => 'dashboard', :layout => false
  end
  
  def index
    @reviews = augment_users(catalogue_instance.find_reviews(params[:id]))
    
    render :partial => 'index', :layout => false
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
