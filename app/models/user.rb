class User < ApplicationRecord
  has_many :interests_users
  has_many :interests, through: :interests_users

  belongs_to :location

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end
