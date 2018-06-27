class Transaction < ApplicationRecord
  belongs_to :credit_bank_account, class_name: "BankAccount"
  belongs_to :debit_bank_account, class_name: "BankAccount"

  after_create :update_bank_accounts


  def update_bank_accounts
    credit_bank_account.update(balance: credit_bank_account.balance.to_f + amount.to_f)
    debit_bank_account.update(balance: debit_bank_account.balance.to_f - amount.to_f)
  end  
end
