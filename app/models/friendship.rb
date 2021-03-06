class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user, presence: true, on: :create
  validates :friend, presence: true, on: :create
  validates :friendship_status, presence: true
  validates :friendship_status, inclusion: {
    in: %w(suggested pending accepted declined),
    message: "%{value} is not a valid status"
  }
end
