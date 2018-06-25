class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum user_type: [ :user, :admin ,:manager ]
  has_one_attached :image
  has_many :addresses
  has_many :bank_accounts
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :bank_accounts, reject_if: :all_blank, allow_destroy: true
  validates :first_name, presence: true 
  validates :last_name, presence: true 
  after_create :send_email,:generate_bank_account_number,:generate_bank_account_details

  def generate_bank_account_details
    bank_accounts.create!(account_number,balance)
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
