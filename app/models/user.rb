class User < ApplicationRecord
  has_secure_password

  mount_uploader :profile_picture, AvatarUploader

  has_many :interests_users
  has_many :interests, through: :interests_users, dependent: :destroy

  # TODO will have to make sure location is given in edit profile page
  belongs_to :location, required: false

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :messages


  # validates :first_name, :last_name, :email, presence: true
  # validates_uniqueness_of :email, case_sensitive: false
  # validates :password, :password_confirmation, presence: true
  # validates :password, length: { in: 4..15 }

  # IMAGE VALIDATION
  # validates_processing_of :image
  # validate :image_size_validation


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
