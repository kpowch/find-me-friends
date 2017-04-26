class UsersController < ApplicationController
  # to render the signup form
  def new
  end

  # to receive the form and create a user with form params
  def create
    @user = User.new(user_params)
    @user.id = User.maximum(:id).next
    @user.profile_picture = File.open(File.join(Rails.root, '/app/assets/images/20170425_125146.jpg'))

    if @user.save
      p @user.inspect
      session[:user_id] = @user.id
      flash[:alert] = "Welcome! Please fill in your interests so we can get started."
      # redirect to edit user path so they can input their interests
      redirect_to edit_user_path(@user.id)
    else
      flash[:alert] = @user.errors.full_messages.to_s # TODO incorporate this into page
      redirect_to new_user_path
    end
  end

  # render user's profile
  def show
    @user = User.find(current_user.id)
    @profile_props = {
      current_user: @user
    }
  end

  # to receive form and edit settings (HTML form)
  def edit
    @user = User.find(current_user.id)
    @interests = Interest.order(:name).all
  end

  # updates edited settings in db
  def update
    @user = User.find(current_user.id)
    @user.update(user_params)

    redirect_to user_path
  end

  # detete account TODO decide if we want this
  def delete
  end

  private

  # iterates through current user interests, generates list of other user matches for each interest.
  # master list of all users that matched plus count
  def friend_finder(int, user)
    # {user_id: count}
    master_list = {}
    while i < int do
      all_interests = InterestUser.find(user_id: user.id)
      while j < all_interests.count do
        interests = all_interests[i]
        while k < interests.count do
          array = User.find(id: interests[k])

        end
      end
    end
    # sort and return master list
    #pass user logic?
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :profile_picture,
      :password,
      :password_confirmation,
      :interest_ids
    )
  end
end
