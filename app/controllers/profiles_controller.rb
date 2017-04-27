class ProfilesController < ApplicationController

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    puts 'query'
    current_friends = friendly_three_amigos_method
    puts 'current_friends'
    puts current_friends
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user,
      current_friends: current_friends
    }
  end

  def friendly_three_amigos_method
    full_user_objects = {}
    friendships = Friendship.where(user_id: current_user.id)
    friendships.each do |friendship|
      full_user_objects[friendship.id] = User.where(id: friendship.friend_id)
    end
    full_user_objects
  end
end
