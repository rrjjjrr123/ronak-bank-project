class Transaction < ApplicationRecord
  belongs_to :credit_bank_account, class_name: "BankAccount"
  belongs_to :debit_bank_account, class_name: "BankAccount"
  has_one :otp
  validate :debit_account_balance
  after_create :generate_otp
  after_create :send_otp_email  
  after_update :update_bank_accounts
  
  enum status: [:inprocess, :complete, :failed] 
  
  def debit_account_balance   
    if debit_bank_account.balance < amount
      errors.add(:balance, "amount is greather than current debit_account_balance")
    end
  end

  def update_bank_accounts
    credit_bank_account.update(balance: credit_bank_account.balance.to_f + amount.to_f)
    debit_bank_account.update(balance: debit_bank_account.balance.to_f - amount.to_f)
  end 
   
  def send_otp_email
    OtpMailer.otp_email(Transaction.last.debit_bank_account.user).deliver
  end  

  def generate_otp  
    otp = SecureRandom.hex(6)
    self.create_otp(otp: otp)
  end 
end
