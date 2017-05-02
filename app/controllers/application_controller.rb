class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # pass current user to all other controllers to reference when needed
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # sends current user to login page if they're not authorized to the page
  def require_login
    if current_user.nil?
      flash[:alert] = "Please sign in to see this content."
      redirect_to :root
    end
  end

  # returns array of user_id's who have matching interests to current user, ordered by # of common interests
  def friendlist(user)
    User.find_by_sql(
      "SELECT
        friend_interests_users.user_id as id,
        count(common_interests.id) as num_common_interests
      FROM
        users as me
        left join interests_users as my_interests_users on my_interests_users.user_id = me.id
        left join interests as common_interests on my_interests_users.interest_id = common_interests.id
        left join interests_users as friend_interests_users on common_interests.id = friend_interests_users.interest_id
      WHERE
        friend_interests_users.user_id <> #{user.id} and
        me.id = #{user.id}
      GROUP BY
        friend_interests_users.user_id
      ORDER BY
        num_common_interests desc;"
    )
  end

  # loops through friendlist array, and saves friendships if it doesn't already exist
  def save_friendships
    array = friendlist(current_user)
    puts "array: \n #{array}"
    array.each do |user|
      puts "user id is #{user.id}"
      puts "current user is #{current_user.id}"
      if Friendship.where("user_id = ? AND friend_id = ?", current_user.id, user.id).exists?
        puts "Friendship already exists: #{Friendship.where("user_id = ? AND friend_id = ?", current_user.id, user.id).inspect}"
        next
      elsif Friendship.where("user_id = ? AND friend_id = ?", user.id, current_user.id).exists?
        puts "Friendship already exists: #{Friendship.where("user_id = ? AND friend_id = ?", user.id, current_user.id).inspect}"
        next
      elsif (user.id == current_user.id)
        puts "Can't be friends with yourself!"
        next
      else
        puts "#{user.id} isn't a friend of #{current_user.id} yet!"
        Friendship.create(user_id: current_user.id, friend_id: user.id, friendship_status: "suggested")
      end
    end
  end
end
