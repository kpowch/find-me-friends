class CreateInterestsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :interests_users,  id: false do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :interest, index: true, foreign_key: true
    end
  end
end
