module ApplicationHelper

  def logged_in?
    !session[:user].nil?
  end

  def current_user
    session[:user]
  end

  def link_to_details(id) 
    "location.href = '#{url_for :controller => 'catalogue', :action => 'details'}?id=#{id}'; return false;"
  end
end
