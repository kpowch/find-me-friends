class User < ApplicationRecord
  has_secure_password

  has_many :interests_users
  has_many :interests, through: :interests_users, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :messages

  mount_uploader :profile_picture, AvatarUploader

  validates :first_name, :last_name, :email, :dob, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length:{ in: 4..15 }, confirmation: true, on: :create
  validate :no_minors, if: :dob
  validates :bio, length: { in: 0..140 }

  # profile picture validation
  # TODO test these
  validates_processing_of :profile_picture
  validate :profile_picture_size_validation

  def self.authenticate_with_credentials(email, password)
    # find the user after stripping email of extra whitespace
    user = User.find_by_email(email.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  private

  def no_minors
    errors.add(:dob, "Sorry, you're too young.") if dob.to_date > 18.years.ago.to_date
  end

  def profile_picture_size_validation
    errors[:profile_picture] << "should be less than 500KB" if profile_picture.size > 0.5.megabytes
  end
end
