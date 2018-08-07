module ControllerMacros
  def login_seller
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:seller]
      seller = FactoryBot.create(:seller)
      sign_in seller
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user_login = FactoryBot.create(:user)
      sign_in @user_login
    end
  end
end
