class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, :user, :chatroom, presence: true
  validates :content, length: { in: 0..140 }
end
