class SearchController < ApplicationController
  def index
    
  end
  
  def show
  end
  
  def create
    @search = Search.new(params[:search][:query])
  end
end
