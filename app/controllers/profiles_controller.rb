class ProfilesController < ApplicationController

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    current_friends = friendly_three_amigos_method
    # puts 'current_friends'
    # puts current_friends
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user,
      current_friends: current_friends
    }
  end

  def friendly_three_amigos_method
    full_user_objects = []
    friendships = Friendship.where(user_id: current_user.id)
    friendships.each do |friendship|
      current = User.where(id: friendship.friend_id)
      current_hash = current.as_json
      current_person = current_hash[0]
      full_user_objects.push({
        id: current_person["id"],
        friendship_id: friendship.id,
        first_name: current_person["first_name"],
        last_name: current_person["last_name"],
        email: current_person["email"],
        profile_picture: current_person["profile_picture"],
        bio: current_person["bio"]
        })
    end
    puts full_user_objects
    full_user_objects
  end
end
