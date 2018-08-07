require 'rails_helper'

RSpec.describe V1::AccountsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @seller = FactoryBot.create(:seller)
    @item = FactoryBot.create(:item, seller_id: @seller.id)
    @order = FactoryBot.create(:order, item_id: @item.id, user_id: @user.id)
    authenticate_user @user
    @bank_account_id = BankAccount.first.id
  end

  describe 'post transfer' do
    it 'retrieves a specific message' do
      post :transfer, params: { order_id: @order.id,
                                credit_acc: BankAccount.first.account_number,
                                debit_acc: BankAccount.first.account_number }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post otp_confirmation' do
    it 'retrieves a specific message' do
      transaction = FactoryBot.create(:transaction,
                                      credit_bank_account_id: @bank_account_id,
                                      debit_bank_account_id: @bank_account_id)
      otp = FactoryBot.create(:otp, transaction_id: transaction.id)
      post :otp_confirmation, params: { order_id: @order.id,
                                        transaction: transaction.id,
                                        otp: otp.otp }
      expect(response).to have_http_status(:success)
    end
  end
end
