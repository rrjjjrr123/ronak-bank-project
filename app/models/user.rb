class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum user_type: [ :user, :admin ,:manager ]
  has_one_attached :image
  has_many :addresses
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  has_many :bank_accounts

  def active_for_authentication? 
    super && approved?   
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved   
    else 
      super # Use whatever other message 
    end 
  end
end
