class UsersController < ApplicationController

  def new
  end

  def create

    p user_params.inspect

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = user.errors.full_messages.to_s
      redirect_to '/register'
    end
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
