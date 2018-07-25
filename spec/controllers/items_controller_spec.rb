require 'rails_helper'
RSpec.describe ItemsController do
  describe "GET index" do
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end 


seller = Seller.create!(full_name: "paras", email: "seller2@gmail.com", password:"test123" ,password_confirmation:"test123")
  describe "POST create" do
    it "redirect_to root path" do
      post :create, :params => {price: "100" , seller_id: seller.id}  
      response.should redirect_to(root_path)
    end    
  end    
end



