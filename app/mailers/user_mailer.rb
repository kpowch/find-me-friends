class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'findmefriends.com'
    mail(to:@user.email, subject: 'Welcome to Find Me Friends')
  end

end
