class User < ApplicationRecord    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  enum user_type: [:user, :admin ,:customer]
  has_one_attached :image
  has_many :orders
  has_many :addresses
  has_one :bank_account
  has_many :beneficiaries 
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable ,:rememberable, :trackable
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :bank_account, reject_if: :all_blank, allow_destroy: true
  validates :first_name,:last_name, presence: true    
  after_create :generate_bank_account_details, :send_email , :deliver_invitation

  def generate_bank_account_details
    self.create_bank_account!(account_number: rand(10 ** 10))
  end      
  
  def send_email
    ConfirmationMailer.confirmation_email(self).deliver
  end

  def name
    "#{first_name} #{last_name}"
  end  
end
