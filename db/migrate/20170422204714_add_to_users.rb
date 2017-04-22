class AddToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :messages
    end
  end
end
