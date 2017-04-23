class ProfileController < ApplicationController

  #show user profile
  def index
    @user = User.where(session[:user_id] = params[:id])
  end

  # update user stats
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:profile], notice: 'Profile updated, friend!'
    else
      render :new
    end
  end

  #remove profile from databse, return to welcome?
  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password_digest,
      :dob,
      :profile_picture,
      :bio
    )
  end
end
