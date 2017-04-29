class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @user = User.find params[:id]

    if @user[:interest_ids].nil?
      @user.update(interest_ids: [])
    end
    @user.update(@user)
    redirect_to 'admin/users'
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to 'admin/users', notice: 'User deleted!'
  end

  private

  def user_params
    params.require(:user)
    .permit(
      :first_name,
      :last_name,
      :dob,
      :email,
      :profile_picture,
      :password,
      :password_confirmation,
      :bio,
      interest_ids: []
    )
  end

end
