module ApplicationHelper

  def logged_in?
    !session[:user].nil?
  end

  def current_user
    session[:user]
  end

end
