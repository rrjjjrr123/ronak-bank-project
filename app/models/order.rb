class Order < ApplicationRecord
  belongs_to :item
  enum status:[:pending ,:delivered ,:failed,:placed]
end
