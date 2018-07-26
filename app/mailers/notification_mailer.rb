class NotificationMailer < ApplicationMailer
  default  from: "admin@gmail.com"

  def send_notification(order)
    @order = order
    mail(to: BlueDart.first.email, subject: 'confirm order')
  end 
end
