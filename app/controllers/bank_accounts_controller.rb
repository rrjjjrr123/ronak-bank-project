class BankAccountsController < ApplicationController
  before_action :authenticate_user!  

  def amount_transfer
    @user = current_user
  end

  def transfer
    @user = current_user
    credit_account_number = BankAccount.find_by(account_number:params[:credit_acc]) 
    debit_account_number = BankAccount.find_by(account_number:params[:debit_acc])
    Transaction.create!(credit_bank_account:credit_account_number,debit_bank_account:debit_account_number,amount:params[:amount])
    redirect_to user_path(@user)
  end

  def add_beneficiary_account
    @user = current_user
  end  
end
