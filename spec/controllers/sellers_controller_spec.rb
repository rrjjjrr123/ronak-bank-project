
require 'rails_helper'
  
RSpec.describe SellersController  do
  
  login_seller

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "renders the index template" do
      seller = FactoryBot.create(:seller)
      get :index, params: {id: seller.id} 
      expect(response).to render_template("index")
    end
  end

  describe 'GET #new' do
    let(:seller_double) { double("seller_double")}
    before(:each) do
      Seller.stub(:new).and_return(seller_double)
      get :new
    end

    it "creates a new seller" do
      expect(assigns(:seller)).to be(seller_double) 
      expect(response).to have_http_status(204)  
    end
  end
end  