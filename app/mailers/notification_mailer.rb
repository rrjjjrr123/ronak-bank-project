# order confirm mail
class NotificationMailer < ApplicationMailer
  default from: 'admin@gmail.com'

  def notification_email(order)
    @order = order
    mail(to: 'bluedart@gmail.com', subject: 'confirm order')
  end
end
