class OrderMailer < ApplicationMailer
  default from: "admin@gmail.com"
  
  def order_email(order)
    @order = order
    mail(to: 'bluedart@gmail.com', subject: 'Order Confirmed')
  end
end
