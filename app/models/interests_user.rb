class InterestsUser < ApplicationRecord
  # has_many :interests_users
  # has_many :users, through: :interests_users
  belongs_to :user
  belongs_to :interest
end
