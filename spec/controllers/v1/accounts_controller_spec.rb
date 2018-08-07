require 'rails_helper'
require 'jwt'

describe V1::AccountsController, type: :api do
  
  before do 
    token = JWT.encode({user: User.first.id}, 
    ENV["AUTH_SECRET"], "HS256")
    header "Authorization", "Bearer #{token}"
    @user = FactoryBot.create(:user)
    @seller = FactoryBot.create(:seller)
    @item = FactoryBot.create(:item, seller_id: @seller.id)
    @order = FactoryBot.create(:order, item_id: @item.id, user_id: @user.id)
  end  

  describe 'post transfer' do   
    it 'retrieves a specific message' do
     post :transfer, params: { order_id: @order.id,
                                 credit_acc: BankAccount.first.account_number,
                                 debit_acc: BankAccount.first.account_number }
      expect(response).to be_success
    end
  end

  describe 'post otp_confirmation' do   
    it 'retrieves a specific message' do
       transaction = FactoryBot.create(:transaction,
                                      credit_bank_account_id: @bank_account_id,
                                      debit_bank_account_id: @bank_account_id)
      otp = FactoryBot.create(:otp, transaction_id: transaction.id)
      post :otp_confirmation, params: { user_id: @user.id, order_id: @order.id,
                                        transaction: transaction.id,
                                        otp: otp.otp }
      expect(response).to be_success
    end
  end  
end