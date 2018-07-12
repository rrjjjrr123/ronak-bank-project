class Item < ApplicationRecord
  belongs_to :seller
  has_many :orders 
end
