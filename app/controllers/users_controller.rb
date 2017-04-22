class UsersController < ApplicationController

  # For a new user to signup
  def new
  end

  # To create the user that just signed up
  def create
    @user = User.new(user_params)
    p @user.inspect

    if @user.save
      session[:user_id] = user.id
      redirect_to profiles_path(params[:product_id])
    else
      flash[:alert] = @user.errors.full_messages.to_s
      redirect_to new_user_path
    end
  end

  # To show the user's settings
  def show
  end

  # To edit settings (HTML form)
  def edit
  end

  # Updates edited settings
  def update
  end

  # TODO delete a user?

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
