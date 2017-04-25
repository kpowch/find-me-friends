module ProfileHelper

  # def current_user (user_id)
  #   @current_user = User.where(:id == user_id)
  # end

  def current_friends (user_id)
    @current_friends = User.where(:id == user_id)
  end
end
