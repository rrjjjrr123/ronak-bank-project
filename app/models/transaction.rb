# this is transaction controller
class Transaction < ApplicationRecord
  belongs_to :credit_bank_account, class_name: 'BankAccount'
  belongs_to :debit_bank_account, class_name: 'BankAccount'
  has_one :otp
  after_create :generate_otp, :send_otp_email, :update_bank_accounts
  enum status: [:inprocess, :complete, :failed]

  def update_bank_accounts
    credit_balance = credit_bank_account.balance.to_f + amount.to_f
    debit_balance = debit_bank_account.balance.to_f - amount.to_f
    credit_bank_account.update(balance: credit_balance)
    debit_bank_account.update(balance: debit_balance)
  end

  def send_otp_email
    OtpMailer.otp_email(Transaction.last.debit_bank_account.user).deliver
  end

  def generate_otp
    otp = SecureRandom.hex(6)
    create_otp(otp: otp)
  end
end
