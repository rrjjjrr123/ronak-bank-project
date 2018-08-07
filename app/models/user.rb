# buisness logic of user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable and

  include DeviseTokenAuth::Concerns::User

  enum user_type: [:user, :customer]
  has_one_attached :image
  has_many :orders
  has_many :addresses
  has_one :bank_account
  has_many :beneficiaries
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :omniauthable, :invitable, :confirmable  
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :bank_account, allow_destroy: true
  validates :first_name, :last_name, presence: true
  after_create :generate_bank_account_details, :send_email, :deliver_invitation

  def generate_bank_account_details
    create_bank_account!(account_number: rand(10**10))
  end

  def send_email
    ConfirmationMailer.confirmation_email(self).deliver
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
