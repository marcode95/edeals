class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def require_login
    return true if logged_in?

    redirect_to welcome_path, notice: 'You must be logged in to access this section!'
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
