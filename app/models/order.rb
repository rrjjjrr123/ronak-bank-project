class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  after_update :send_notification_email
  enum status: [:pending ,:delivered ,:failed, :placed]

  def send_notification_email
    NotificationMailer.send_notification(self).deliver
  end 
end
