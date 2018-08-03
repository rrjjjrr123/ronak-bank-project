module Api
  module V1
    class BankAccountsController < Api::BaseController    
      before_action :authenticate_user!
      before_action :get_order   

      def transfer       
        credit_account_number = BankAccount.find_by(account_number: params[:credit_acc]) 
        debit_account_number = BankAccount.find_by(account_number: params[:debit_acc])
        @transaction = Transaction.create!(credit_bank_account: credit_account_number, debit_bank_account: debit_account_number, amount: params[:amount])
        render json: @transaction, status:201    
      end
     
      def otp_confirmation
        transaction = Transaction.find(params[:transaction])   
        if transaction.otp.otp.eql?(params[:otp]) 
          transaction.update_attributes(status: 1)
          @order.update_attributes(status:3)
          current_user.update(user_type: 1)
          render json: @order, status: 200  
        else
          render json: {status: "error"} 
        end 

      end 

      private
      
      def get_order 
        @order = Order.find(params[:order_id])  
      end 
    end  
  end  
end  