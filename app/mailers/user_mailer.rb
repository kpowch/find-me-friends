class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'https://findmefriends.herokuapp.com/'
    mail(to:@user.email, subject: 'Welcome to Find Me Friends')
  end

  def new_friend(user, friend)
    @user = user
    @friend = friend
    mail(to:@user.email, subject: 'You Have a New Friend!')
  end

end
