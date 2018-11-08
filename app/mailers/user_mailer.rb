class UserMailer < ApplicationMailer
  default from: 'JamalsBnB@JamalsWorld.com'

  def welcome_mail(user)
    @user = user
    @url = home_index_path
    mail(to: @user.email, subject: "Welcome #{@user}! Enjoy your stay with us!")
  end
end
