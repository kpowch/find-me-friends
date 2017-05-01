class ProfilesController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login

  helper ProfileHelper

  # This shows the user's profile - their name, info, friends
  def index
    current_friends = friendly_three_amigos_method
    pending_friends = pending_three_amigos_method
    suggested_friends = suggested_three_amigos_method

    save_friendships
    # Pass in props to profile page
    @profile_props = {
      current_user: current_user,
      #passes in friends suggested
      current_friends: current_friends,
      #grabs friends with status pending
      pending_friends: pending_friends,
      #friend status of suggested
      suggested_friends: suggested_friends
    }
  end

  def friendly_three_amigos_method
    full_user_objects = []
    friendships = Friendship.where(user_id: current_user.id)
    friendships.each do |friendship|
      current = User.where(id: friendship.friend_id)
      current_hash = current.as_json
      current_person = current_hash[0]
      puts "current person thumb: #{current_person.inspect}"
      full_user_objects.push({
        current_user_id: current_user.id,
        id: current_person["id"],
        friendship_id: friendship.id,
        first_name: current_person["first_name"],
        last_name: current_person["last_name"],
        email: current_person["email"],
        profile_picture: current_person["profile_picture.thumb.url"],
        bio: current_person["bio"],
        friendship: friendship
        })
    end
    full_user_objects
  end

  def pending_three_amigos_method
    full_user_objects = []
    pending = Friendship.where(user_id: current_user.id).where(friendship_status: "pending" && "Pending")
    pending.each do |friendship|
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
    full_user_objects
  end

  def suggested_three_amigos_method
    full_user_objects = []
    suggested = Friendship.where(user_id: current_user.id).where(friendship_status: "suggested" && "Suggested")
    suggested.each do |friendship|
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
    full_user_objects
  end

end
