# This is welcome mail of user
class ConfirmationMailer < ApplicationMailer
  default from: 'admin@gmail.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Mail')
  end
end
