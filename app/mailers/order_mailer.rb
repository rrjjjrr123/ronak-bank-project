class OrderMailer < ApplicationMailer
  default from: "admin@gmail.com"
  
  def order_email(order)
    @order = order
    mail(to: BlueDart.first.email, subject: 'Order Confirmed')
  end
end
