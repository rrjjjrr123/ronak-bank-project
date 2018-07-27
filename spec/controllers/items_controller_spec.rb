$LOAD_PATH << '.'
require 'rails_helper'
require 'pry'
RSpec.describe ItemsController  do
  login_seller

  describe "GET index" do
    it "populates an array of items" do
      get :index
      assigns(:items).should eq(Item.all)
    end      

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end 

  describe "POST create" do
  
    context "with valid attributes" do
      let(:item_params) { FactoryBot.attributes_for(:item)}
      let(:create!) { post :create, params: {item: item_params}}
      it "creates new item" do     
        expect { create! }.to change { Item.count }.by 1
      end
    end
  end

  describe 'GET #new' do
    let(:item_double) { double("item_double")}
    before(:each) do
      Item.stub(:new).and_return(item_double)
      get :new
    end

    it "creates a new item" do
      expect(assigns(:item)).to be(item_double)
    end
  end
  
  describe 'GET #purchase_item' do
    login_user
    it "gives purchase_item id" do  
      item = FactoryBot.create(:item)
      get :purchase_item,  params: {id: item.id}
      expect(response).to render_template("purchase_item")
    end  
  end
end
