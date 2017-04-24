class ProfilesController < ApplicationController

  #dummy index profile
  def index
    # Pass in props to profile page; After unit testing complete;
    @profile_props = {name: 'Wyatt', friends: ['Beavis', 'Butthead', 'The Other Guy']}
    p @profile_props.inspect
    # @user = User.where(session[:user_id] = params[:id])
  end

  # update user stats - moved logic to user_controller?
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
