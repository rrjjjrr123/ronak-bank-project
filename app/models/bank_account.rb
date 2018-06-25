class BankAccount < ApplicationRecord
  
  belongs_to :user
  validates :account_number , presence: true , uniqueness: true
  validates :balance , presence: true , numericality: true ,on: :update
  before_validation :load_defaults
  befor_create :generate_account_number

  def generate_account_number
   self.account_number = rand(10 ** 10)
  end

  def load_defaults
    
    if self.new_record?
      self.balance = 0.0
    end 
  end
end