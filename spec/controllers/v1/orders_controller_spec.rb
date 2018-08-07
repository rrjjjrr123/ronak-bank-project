require 'rails_helper'

describe V1::OrdersController, type: :api do


  before do
    token = JWT.encode({user: User.first.id}, 
    ENV["AUTH_SECRET"], "HS256")
    header "Authorization", "Bearer #{token}"
    @seller = FactoryBot.create(:seller)
    @item = FactoryBot.create(:item, seller_id: seller.id)
    @user = FactoryBot.craet(:user)
    @order = FactoryBot.create(:order, item_id: item.id, user_id: user.id)
  end  

 
  describe 'orders show' do   
    it 'retrieves a specific message' do
      get :show, params: { id: @order.id }
      expect(response).to be_success
    end
  end

  describe 'orders create' do 
    it 'retrieves a specific message' do
      post :create, params: { item_id: @item.id, quantity: @item.quantity }
      expect(response).to be_success
    end
  end

  describe 'orders' do   
    it 'retrieves a specific message' do
      get: view_order 
      expect(response).to be_success
    end
  end  
end