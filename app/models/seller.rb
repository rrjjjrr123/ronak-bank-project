class Seller < ApplicationRecord
 
  # include DeviseTokenAuth::Concerns::Seller

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  ,:timeoutable, :omniauthable 
  has_many :items
  
  def admin?
    false       
  end     
end
