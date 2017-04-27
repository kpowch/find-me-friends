class ProfilesController < ApplicationController

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    puts 'query'
    current_friends = Friendship.where(user_id: current_user.id).where("friendship_status IN (?) OR friendship_status IN (?)", 'initiated', 'limbo')
    puts 'current_friends'
    puts current_friends
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user,
      current_friends: current_friends
    }
  end

  def friendly_three_amigos_function

  end
end
