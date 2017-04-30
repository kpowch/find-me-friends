class Interest < ApplicationRecord
  has_many :interests_users
  has_many :users, through: :interests_users

  validates :name, presence: true
end
