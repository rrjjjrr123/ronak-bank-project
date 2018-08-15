# this is seller
class Seller < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable
  has_many :items

  def admin?
    false
  end
end
