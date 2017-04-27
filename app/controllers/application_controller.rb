class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # sends user to login page if they're not logged in on unauthorized page
  def authorize
    redirect_to '/login' unless current_user
  end




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

  def save_friendships
    array = friendlist(current_user)
    array.each do |id|
      if Friendship.where(friend_id: id)
        next
      else
        Friendship.new(user_id: current_user.id, friend_id: id, friendship_status: "initialized")
      end
    end
  end
end
