module V1
  # this is accounts api
  class AccountsController < BaseController
    before_action :authenticate_user!
    before_action :find_order_id

    def transfer
      credit_acc = params[:credit_acc]
      debit_acc = params[:debit_acc]
      credit_acc_no = BankAccount.find_by(account_number: credit_acc)
      debit_acc_number = BankAccount.find_by(account_number: debit_acc)
      @transaction = Transaction.create!(credit_bank_account: credit_acc_no,
                                         debit_bank_account: debit_acc_number,
                                         amount: params[:amount])
      render json: @transaction, status: 201
    end

    def otp_confirmation
      transaction = Transaction.find(params[:transaction])
      if transaction.otp.otp.eql?(params[:otp])
        transaction.update_attributes(status: 1)
        @order.update_attributes(status: 3)
        current_user.update(user_type: 1)
        render json: @order, status: 200
      else
        render json: { status: 'error' }
      end
    end

    private

    def find_order_id
      @order = Order.find(params[:order_id])
    end
  end
end
