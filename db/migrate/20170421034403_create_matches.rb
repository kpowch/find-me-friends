class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      # person requesting friendship
      t.references :user, index: true, foreign_key: true
      # person waiting on to accept
      t.index :friend_id, foreign_key: true

      # matched accepted, pending, or denied
      t.string :matched

      t.timestamps null: false
    end
  end
end
