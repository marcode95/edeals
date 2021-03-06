module SessionsHelper
  def logged_in_render
    if logged_in?
      render 'sessions/logged_in'
    else
      render 'sessions/logged_out'
    end
  end
end
