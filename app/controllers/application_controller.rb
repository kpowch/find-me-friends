class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Pass current user to all other controllers
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Sends user to login page if they're authorized to the page
  def authorize
    redirect_to '/login' unless current_user
  end
end
