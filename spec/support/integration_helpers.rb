module IntegrationHelpers

  def sign_in(user)
    byebug
    user = FactoryBot.create(:user)  
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log in'
  end

  def sign_in_seller(seller)
    visit root_path
    first(:link, 'Sell on e-commerce').click
    fill_in "Email",    :with => seller.email
    fill_in "Password", :with => seller.password
    click_button 'Log in'
  end  
end  