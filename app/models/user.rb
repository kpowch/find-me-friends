class User < ApplicationRecord
  has_secure_password

  has_many :interests_users
  has_many :interests, through: :interests_users

  belongs_to :location

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :messages
  has_many :chatrooms, through: :messages

  validates_uniqueness_of :email, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  # validates :password, length: length: { in: 4..20 }

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      user
    end
  end
end

