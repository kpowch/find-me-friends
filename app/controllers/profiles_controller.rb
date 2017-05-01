class ProfilesController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    current_friends = friendly_three_amigos_method
    pending_friends = pending_three_amigos_method

    save_friendships
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user,
      current_friends: current_friends,
      pending_friends: pending_friends
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
        current_user_id: current_user.id,
        id: current_person["id"],
        friendship_id: friendship.id,
        first_name: current_person["first_name"],
        last_name: current_person["last_name"],
        email: current_person["email"],
        profile_picture: current_person["profile_picture"],
        bio: current_person["bio"],
        friendship: friendship
        })
    end
    puts full_user_objects
    full_user_objects
  end

  # returns an array of users who have asked the user to be a friend
  def pending_three_amigos_method
    pendingFriends = []
    # TODO friend_id is currently hard-coded to 2. should be current_user.id
    pendingFriendships = Friendship.where("friend_id = ? AND friendship_status = ?", 7, "pending")
    pendingFriendships.each do |friendship|
      # 'user' is the person who initiated the friendship
      user = User.find(friendship.user_id)
      # add the user's info to the array
      pendingFriends.push({
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        dob: user.dob,
        profile_picture: user.profile_picture.thumb.url,
        bio: user.bio
      })
    end
    # puts "\n\n\n\n\n\n\n\n\n\n pending friends: #{pendingFriends} \n\n\n\n\n"
    pendingFriends
  end
end
