class Order < ApplicationRecord
  
  belongs_to :item
  belongs_to :user
  after_update :send_notification, :user_notification
  enum status: [:pending , :delivered , :failed, :placed]

  def send_notification
    OrderMailer.order_email(self).deliver
  end 
  
  def user_notification
    UserMailer.user_email(self).deliver
  end  
end
