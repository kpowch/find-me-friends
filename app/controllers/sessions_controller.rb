class SessionsController < ApplicationController
  # renders login form
  def new
  end

  # to receive form and sign in user
  def create
    # authenticate email-password combo and strip email of edge whitespace
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      session[:user_id] = user.id
      redirect_to '/' # TODO change this redirect to profile
    else
      flash[:alert] = "There was an error with your credentials. Please try again."
      redirect_to '/login'
    end
  end

  # to logout
  def destroy
    flash[:alert] = "You have successfully been logged out. Come back soon!"
    session[:user_id] = nil
    redirect_to '/login'
  end
end
