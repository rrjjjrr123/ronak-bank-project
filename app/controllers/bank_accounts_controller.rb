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
    @order = Order.find(params[:order_id]) 
  end

  def transfer
    @order = Order.find(params[:order_id])
    credit_account_number = BankAccount.find_by(account_number:params[:credit_acc]) 
    debit_account_number = BankAccount.find_by(account_number: params[:debit_acc])
    @transaction = Transaction.create!(credit_bank_account:credit_account_number,debit_bank_account:debit_account_number,amount:params[:Amount])
  end
 
  def otp_update
    @transaction = Transaction.find(params[:transaction])
    @order = Order.find_by(id:params[:order_id])
    if @transaction.otp.otp == params[:otp]
      @transaction.update_attributes(status: 1)
      @order.update_attributes(status:3)
      redirect_to user_order_path(current_user,@order)  
    end 
  end   

  def add_beneficiary_account

  end
end
