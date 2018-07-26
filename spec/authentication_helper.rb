module AuthenticationHelper
  module Controller
    def sign_in(seller)
      controller.stub(:current_seller).and_return(seller)
      controller.stub(:seller_id).and_return(seller.id)
    end
  end

  module Feature
    def sign_in(seller)
      visit "/login"
      fill_in "Email", with: seller.email
      fill_in "Password", with: seller.password
      click_button "Log In"
    end
  end
end
