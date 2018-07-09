class BalanceValidator < ActiveModel::Validator
  def validate(record)
    if debit_bank_account.balance < amount
      record.errors.add(:balance,"amount is greater")
    end  
  end  
end  
