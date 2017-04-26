class AddFriendshipRefToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatrooms, :friendship, foreign_key: true
  end
end
