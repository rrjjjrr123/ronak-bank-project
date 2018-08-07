require 'rails_helper'

RSpec.describe V1::OrdersController, type: :controller do
  before do
    @seller = FactoryBot.create(:seller)
    @item = FactoryBot.create(:item, seller_id: @seller.id)
    @user = FactoryBot.create(:user)
    @order = FactoryBot.create(:order, item_id: @item.id, user_id: @user.id)
  end
  describe 'orders show' do
    it 'retrieves a specific message' do
      get :show, params: { id: @order.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'orders create' do
    it 'retrieves a specific message' do
      post :create, params: { item_id: @item.id, quantity: @item.quantity,
                              user_id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'orders' do
    it 'retrieves a specific message' do
      get :veiw_order, params: { user_id: @user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
