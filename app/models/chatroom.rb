class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :friendship
  has_many :users, through: :friendship
  has_many :friends, through: :friendship

  validates :friendship, presence: true
end
