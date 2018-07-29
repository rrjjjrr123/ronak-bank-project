module ControllerMacros
  def login_seller
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:seller]
      seller = FactoryBot.create(:seller)
       # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in seller
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
       # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end  
  end  
end