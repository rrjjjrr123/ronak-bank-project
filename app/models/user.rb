class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  enum user_type: [ :user, :admin ,:manager ]
  has_one_attached :image
  has_many :addresses
  has_one :bank_account
  has_many :beneficiaries
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :bank_account, reject_if: :all_blank, allow_destroy: true
  validates :first_name, presence: true 
  validates :last_name, presence: true 
  after_create :generate_bank_account_details
  after_create :send_email 

  def generate_bank_account_details
    bank_accounts.create!(account_number: rand(10 ** 10))
  end
  
  def send_email
    ExampleMailer.sample_email(self).deliver
  end

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
