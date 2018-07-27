$LOAD_PATH << '.'
require 'rails_helper'
require 'pry'

RSpec.describe OrdersController, type: :controller do

  login_user
  
  describe "Order" do

    context "testing Orders controller" do
      before(:each) do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
      end 
    end  

    describe "POST orders#create" do  
      context "with valid params" do 
        let(:order_params) { FactoryBot.attributes_for(:order)}
        it "creates a new order" do
          expect { post :create, params: { item_id: @item.id, order: order_params.merge(order_confirmation: "true")}
           }.to change { Order.count }.by(1)
        end
      end
    end

    describe "GET orders#show" do
      context "show action" do    
      
        it "should render orders#show template" do
          order  = FactoryBot.create(:order,item_id: @item.id, user_id: user.id)
          get :show, params: {id: order.id, item_id: @item.id}
          expect(response).to render_template("show")
        end
      end
    end

    describe "GET orders#veiw_order" do
      context "show action" do
        it "should render orders#veiw_order template" do 
          order  = FactoryBot.create(:order,item_id: @item.id, user_id: user.id)
          get :veiw_order, params: {id: order.id, user_id: @user.id}
          expect(response).to render_template("veiw_order")
        end
      end
    end 
  end  
end  
