class Chatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :message_id

      t.timestamp :true
    end
  end
end
