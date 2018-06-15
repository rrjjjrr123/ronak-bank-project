class BankAccount < ApplicationRecord

  belongs_to :user
  validates :account_number , presence: true , uniqueness: true
  validates :balance , presence: true , numericality: true

  before_validation :load_defaults

  def load_defaults
    
    if self.new_record?
      self.balance = 0.0
    end  
  end 
end
