class SessionsController < ApplicationController
  # renders login form
  def new
  end

  # receive form and sign in user
  def create
    # authenticate email-password combo and strip email of edge whitespace
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      session[:user_id] = user.id
      # should be saving friendships everytime a user logs in
      # TODO do we need this here?
      save_friendships
      redirect_to profiles_path
    else
      flash[:alert] = "There was an error with your credentials. Please try again."
      redirect_to '/login'
    end
  end

  # logout
  def destroy
    flash[:alert] = "You have successfully been logged out. Come back soon!"
    session[:user_id] = nil
    redirect_to :root
  end
end
