class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :notifications
  belongs_to :friendship
  has_many :users, through: :friendship
  has_many :friends, through: :friendship

  validates :friendship_id, presence: true
end
