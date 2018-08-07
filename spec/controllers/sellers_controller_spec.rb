require 'rails_helper'
RSpec.describe SellersController do
  login_seller

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders the index template' do
      seller = FactoryBot.create(:seller)
      get :index, params: { id: seller.id }
      expect(response).to render_template('index')
    end
  end
end
