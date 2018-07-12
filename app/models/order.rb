class Order < ApplicationRecord
  belongs_to :item
    enum status:[:pending ,:successfull]
end
