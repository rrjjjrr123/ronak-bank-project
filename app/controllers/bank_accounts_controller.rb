class BankAccountsController < ApplicationController
  before_action :authenticate_user!  

  def index
    @user = current_user
    @transactions = Transaction.all
    respond_to do |format|
      format.html  
      format.pdf do
        pdf = BankAccountPdf.new(@transactions)
        send_data pdf.render ,filename:'bank_accounts.pdf',type:'application/pdf',disposition: "incline"
      end  
    end   
  end

  def amount_transfer
    @user = current_user
  end

  def transfer
    @user = current_user
    credit_account_number = BankAccount.find_by(account_number:params[:credit_acc]) 
    debit_account_number = BankAccount.find_by(account_number:params[:debit_acc])
    Transaction.create!(credit_bank_account:credit_account_number,debit_bank_account:debit_account_number,amount:params[:Amount])   
  end
 
  def otp_update 
    @user = current_user
    if Otp.last.otp == params[:otp] 
      Transaction.last.update_attributes(status:1)
      redirect_to user_path(@user)
    end  
  end   

  def add_beneficiary_account
    @user = current_user
  end
end
