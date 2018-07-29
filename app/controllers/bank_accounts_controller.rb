class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order   

  def amount_transfer
  end

  def transfer       
    credit_account_number = BankAccount.find_by(account_number: params[:credit_acc]) 
    debit_account_number = BankAccount.find_by(account_number: params[:debit_acc])
    @transaction = Transaction.create!(credit_bank_account: credit_account_number, debit_bank_account: debit_account_number, amount: params[:amount])
  end
 
  def otp_confirmation
    debugger
    transaction = Transaction.find(params[:transaction])   
    if transaction.otp.otp == params[:otp]
      transaction.update_attributes(status: 1)
      @order.update_attributes(status:3)
      current_user.update(user_type: 1)
      redirect_to user_order_path(current_user, @order)  
    end 
  end 

  private
  
  def get_order 
    @order = Order.find(params[:order_id])  
  end
end     