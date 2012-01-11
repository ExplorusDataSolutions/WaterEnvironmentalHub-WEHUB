module UserHelper

  def current_profile_logged_in?
    current_user.id.to_i == @profile.id.to_i
  end

end
