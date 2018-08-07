# this is otp class
class Otp < ApplicationRecord
  belongs_to :owner, foreign_key: 'transaction_id', class_name: 'Transaction'
end
