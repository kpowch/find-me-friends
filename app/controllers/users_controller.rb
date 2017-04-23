class UsersController < ApplicationController
  # to render the signup form
  def new
  end

  # to receive the form and create a user with form params
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = "Welcome! Please fill in your interests so we can get started."
      # redirect to edit user path so they can input their interests (not profiles_path yet)
      redirect_to edit_user_path(@user.id)
    else
      flash[:alert] = @user.errors.full_messages.to_s # TODO incorporate this into page
      redirect_to new_user_path
    end
  end

  # render user's settings
  # TODO this might have to connect to the profile sidebar
  def show
    # TODO page that shows their current info
  end

  # to receive form and edit settings (HTML form)
  def edit
    @interests = Interest.order(:name).all
  end

  # updates edited settings
  def update
  end

  # detete account TODO decide if we want this
  def delete
  end

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
