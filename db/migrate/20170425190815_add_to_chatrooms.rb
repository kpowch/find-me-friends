class AddToChatrooms < ActiveRecord::Migration[5.0]
  def change
    change_table :chatrooms do |t|
    t.string :slug
    end
  end
end
