class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite.fr'
  def welcome_email(user)
    @user = user

    @url = 'http://eventbrite.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
