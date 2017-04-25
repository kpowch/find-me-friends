class ProfilesController < ApplicationController
  # calls in methods from helper
  helper ProfileHelper
  #dummy index profile
  def index
    # Pass in props to profile page; After unit testing complete;
    @profile_props = {name: 'Wyatt', bio: 'Likes to be fun.', friends: ['Beavis', 'Butthead', 'The Other Guy']}
    p @profile_props.inspect
    # @user = User.where(session[:user_id] = params[:id])
  end

  def show
    @profile_props = {
      current_user: current_user
    }
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
