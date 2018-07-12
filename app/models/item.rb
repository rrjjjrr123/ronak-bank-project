class Item < ApplicationRecord
  attr_accessor :image
  belongs_to :seller
  has_many :orders 
  mount_uploader :image, ImageUploader
end
