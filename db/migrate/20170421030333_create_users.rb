class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :location, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.date :dob
      t.string :profile_picture
      t.text :bio

      t.timestamps null: false
    end
  end
end
