# this is item class
class Item < ApplicationRecord
  attr_accessor :image
  belongs_to :seller
  has_many :orders
  mount_uploader :image, ImageUploader
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 100_000_0 }
end
