class ReviewsController < ApplicationController

  before_filter :verify_logged_in, :only => [:create]  
  
  def index
    @reviews = catalogue_instance.find_reviews(params[:id])
    
    @users = socialnetwork_instance.users
    
    @reviews = augment_users(@reviews, @users) unless @users.nil?

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

  def augment_users(reviews, users)
    reviews.each_with_index do |r, i|
      user = find_user(users, r.user_id)
      reviews[i].merge!(:user => user) unless user.nil?
    end unless users.nil? || users.empty?
  end
  
  def find_user(users, id)
    users.each do |u|
      if u.id.to_i == id.to_i
        return u
      end
    end
    
    nil
  end  
  
end
