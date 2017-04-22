class Messages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :chatroom_id
  end
end
