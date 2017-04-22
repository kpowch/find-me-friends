class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    p @user.inspect

    if @user.save
      session[:user_id] = user.id
      redirect_to profiles_path(params[:product_id])
    else
      flash[:alert] = @user.errors.full_messages.to_s
      redirect_to 'users/new'
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
