class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # sends user to login page if they're not logged in on unauthorized page
  def authorize
    redirect_to '/login' unless current_user
  end

end
