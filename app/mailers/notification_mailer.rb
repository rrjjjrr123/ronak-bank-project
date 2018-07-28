class NotificationMailer < ApplicationMailer
  default from: "admin@gmail.com"
  
  def notification_email(order)
    @order = order
    mail(to: BlueDart.first.email, subject: 'confirm order')
  end
end
