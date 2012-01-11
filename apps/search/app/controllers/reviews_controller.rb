class ReviewsController < ApplicationController

  include ReviewHelper
  
  before_filter :verify_logged_in, :only => [:create] 
  
  caches_action :index, :if => Proc.new{ |c| c.params[:page].to_i == 1 }, :cache_path => :index_key.to_proc, :expires_in => 24.hours
  caches_action :summary, :cache_path => :summary_key.to_proc, :expires_in => 24.hours
    
  def index_key(uuid=params[:id])
    "reviews/index/#{uuid}"
  end
  
  def summary_key(uuid=params[:id])
    "reviews/summary/#{uuid}"
  end

  def dashboard
    @review_summary = catalogue_instance.find_review_summary(params[:id])

    render :partial => 'dashboard', :layout => false
  end
  
  def index  
    @reviews = augment_users(catalogue_instance.find_reviews(params[:id], params[:page], params[:page_size]))
    
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
    
    expire_fragment index_key
    expire_fragment summary_key

    render :nothing => true, :status => (response.nil? ? 500 : :ok)
  end
  
end
