class ProfileController < ApplicationController
  #show user profile
  def index
    @user = User.where(session[:user_id] = params[:id])
  end
  # update user stats
  def create
  end
  #remove profile from databse, return to welcome?
  def destroy
  end

end
