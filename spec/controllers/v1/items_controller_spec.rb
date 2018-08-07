require 'rails_helper'

RSpec.describe V1::ItemsController, type: :controller do
  describe 'get index' do
    it 'retrieves a specific message' do
      get :index, params: { format: :json }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    let(:item_double) { double('item_double') }
    before(:each) do
      Item.stub(:new).and_return(item_double)
      get :new
    end

    it 'creates a new item' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post create' do
    let(:item_params) { FactoryBot.attributes_for(:item) }
    it 'retrieves a specific message' do
      seller = FactoryBot.create(:seller)
      authenticate_seller seller
      post :create, params: { item: item_params }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get purchase_item' do
    it 'retrieves a specific message' do
      seller = FactoryBot.create(:seller)
      item = FactoryBot.create(:item, seller_id: seller.id)
      get :purchase_item, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end
end
