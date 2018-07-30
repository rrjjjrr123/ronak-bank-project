require 'rails_helper'
  
RSpec.describe BankAccountsController do
  
  login_user

  before(:each) do
    @user = FactoryBot.create(:user)
    @seller = FactoryBot.create(:seller)
    @item = FactoryBot.create(:item, seller_id: @seller.id)
    @order = FactoryBot.create(:order, item_id: @item.id, user_id: @user.id )  
  end

  describe "GET amount_transfer" do
    it "renders the index template" do
      get :amount_transfer, params: { user_id: @user.id, order_id: @order.id}
      expect(response).to render_template("amount_transfer")
    end
  end

  describe "transfer" do
    it "renders the transfer template" do
      patch :transfer, params: { user_id: @user.id, order_id: @order.id, credit_acc: BankAccount.first.account_number, debit_acc: BankAccount.first.account_number ,amount:"5000.0" } 
      expect(response).to render_template("transfer")
    end
  end

  describe "otp_confirmation" do  
    it "renders the orders#show" do
      transaction = FactoryBot.create(:transaction, credit_bank_account_id: BankAccount.first.id, debit_bank_account_id: BankAccount.first.id)
      otp = FactoryBot.create(:otp, transaction_id: transaction.id)
      post :otp_confirmation, params: { user_id: @user.id, order_id: @order.id, transaction: transaction.id, otp: otp.otp } 
      expect(response).to redirect_to(user_order_path(@user_login, @order.id))
    end
  end
end       
  