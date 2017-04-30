class UsersController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  # render the signup form
  def new
  end

  # receive the form and create a user with form params
  def create
    @user = User.new(user_params)
    # TODO do we need this? once we seed fresh the ids should automatically increment properly
    @user.id = User.maximum(:id).next

    @user.profile_picture = File.open(File.join(Rails.root, '/app/assets/images/no_photo.jpg'))
    @user.bio = '';

    respond_to do |format|
      if @user.save
        p @user.inspect
        session[:user_id] = @user.id
        flash[:alert] = "Welcome! Please fill in your interests so we can get started."
        #send email when a new user is registered
        UserMailer.welcome_email(@user).deliver_now

        # redirect to edit user path so they can input their interests
        format.html { redirect_to edit_user_path(@user.id) }
        format.json { render json: @user, status: :created, location: @user }
      else
        flash[:alert] = @user.errors.full_messages.to_s # TODO incorporate this into page
        format.html { redirect_to new_user_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # render user's profile
  def show
    @user = User.find(params[:id])
  end

  # receive form and edit settings (HTML form)
  def edit
    @user = User.find(current_user.id)
    @interests = Interest.all.order(:name)
    save_friendships
  end

  # updates edited settings in db
  def update
    @user = User.find(current_user.id)

    # if they have no interests, make interest_ids = empty array
    # otherwise it'll automatically save with one interest
    if user_params[:interest_ids].nil?
      @user.update(interest_ids: [])
    end
    @user.update(user_params)
    redirect_to profiles_path
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
