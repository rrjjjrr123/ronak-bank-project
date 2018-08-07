# User confirmation mailer
class UserMailer < ApplicationMailer
  default from: 'admin@gmail.com'

  def user_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'User confirmation')
  end
end
