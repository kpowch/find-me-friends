class User < ApplicationRecord

  has_and_belongs_to_many :interests
  belongs_to :location

  has_many :matches
  has_many :friends, class_name "User", foreign_key: "friend_id", through :matches

end
