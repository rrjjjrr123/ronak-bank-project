class Beneficiary < ApplicationRecord
  belongs_to :user
  belongs_to :beneficiary, class_name: 'User'

  def beneficiary_account_number
    beneficiary.bank_account.account_number
  end

    
end
