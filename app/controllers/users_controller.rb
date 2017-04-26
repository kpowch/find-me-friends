class UsersController < ApplicationController
  # to render the signup form
  def new
  end

  # to receive the form and create a user with form params
  def create
    @user = User.new(user_params)
    @user.id = User.maximum(:id).next
    @user.profile_picture = File.open(File.join(Rails.root, '/app/assets/images/20170425_125146.jpg'))
    @user.bio = '';

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
    @user = User.find(params[:id])
  end

  # to receive form and edit settings (HTML form)
  def edit
    @user = User.find(current_user.id)
    @interests = Interest.all.order(:name)
  end

  # updates edited settings in db
  def update
    @user = User.find(current_user.id)

    # if they have no interests, make interest_ids = empty array
    # otherwise it'll not 'save' and at least one interest will be checked
    if user_params[:interest_ids].nil?
      @user.update(interest_ids: [])
    end
    @user.update(user_params)
    redirect_to user_path
  end

  # detete account TODO decide if we want this
  def delete
  end

  private

  # iterates through current user interests, generates list of other user matches for each interest.
  # master list of all users that matched plus count

  def friend_seed
    seed_hash = {}
    while i < 3 do
      seed_hash[:i] = friend_finder
    end

  def friend_finder
    user = User.find(current_user.id)
    # {user_id: count}
    master_list = {}
    all_interests = InterestUser.find(user_id: user.id)

    puts all_interests

    while i < all_interests.count do
      interest = all_interests[i]
      puts interests

      while j < interest.count do
        array = InterestUser.find(interest_id: interests[j])
        puts array

        while k < array.count do
          puts array[k]


          if master_list.has_key?(:array[k])
            master_list[:array[k]] += 1
          else
            master_list[:array[k]] = 1
        end
      end
      master_list.sort
    end
    # sort and return master list
    # HASH.MERGE
    #pass user logic?
  end

  def user_params
    params.require(:user)
    .permit(
      :first_name,
      :last_name,
      :email,
      :profile_picture,
      :password,
      :password_confirmation,
      interest_ids: []
    )
  end
end
