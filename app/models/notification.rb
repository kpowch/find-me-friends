class Notification < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, :user, :chatroom, presence: true
end
