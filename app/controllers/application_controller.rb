class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # pass current user to all other controllers
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # sends user to login page if they're authorized to the page
  def require_login
    if current_user.nil?
      flash[:alert] = "Please sign in to see this content."
      redirect_to :root
    end
  end

  # returns an array of user_id's from user with matching interests, ordered by # of hits
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

  # should save friendships based on array provided by friendlist
  # loops through id's, see if friendship already exists
  def save_friendships
    array = friendlist(current_user)
    puts "array"
    puts array
    array.each do |user|
      puts 'user id is '
      puts user.id
      if Friendship.where(friend_id: user.id).exists?
        puts 'darn'
        puts Friendship.where(friend_id: user.id)
        next
      else
        puts 'shit'
        Friendship.create(user_id: current_user.id, friend_id: user.id, friendship_status: "initialized")
      end
    end
  end
end
