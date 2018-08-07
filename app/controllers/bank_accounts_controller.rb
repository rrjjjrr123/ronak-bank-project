# this is the bank accounts controller for transaction
class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order

  def amount_transfer; end

  def transfer
    credit_acc = params[:credit_acc]
    debit_acc =  params[:debit_acc]
    credit_acc_no = BankAccount.find_by(account_number: credit_acc)
    debit_account_no = BankAccount.find_by(account_number: debit_acc)
    @transaction = Transaction.create!(credit_bank_account: credit_acc_no,
                                       debit_bank_account: debit_account_no,
                                       amount: params[:amount])
  end

  def otp_confirmation
    transaction = Transaction.find(params[:transaction])
    if transaction.otp.otp == params[:otp]
      transaction.update_attributes(status: 1)
      @order.update_attributes(status: 3)
      current_user.update(user_type: 1)
      redirect_to user_order_path(current_user, @order)
    else
      root_path
    end
  end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end
end
  