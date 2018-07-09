class BankAccountsController < ApplicationController
  before_action :authenticate_user!  

  def index
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
  end

  def transfer
    credit_account_number = BankAccount.find_by(account_number:params[:credit_acc]) 
    debit_account_number = BankAccount.find_by(account_number:params[:debit_acc])
    @transaction = Transaction.create!(credit_bank_account:credit_account_number,debit_bank_account:debit_account_number,amount:params[:Amount])
  end
 
  def otp_update
    @transaction = Transaction.find(params[:transaction])
    if @transaction.otp.otp == params[:otp]
      Transaction.find(@transaction.id).update_attributes(status: 1)
      redirect_to root_path  
    end 
  end   

  def add_beneficiary_account

  end
end
