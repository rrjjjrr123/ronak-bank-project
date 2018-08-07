module IntegrationHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def seller_sign_in(seller)
    visit new_seller_session_path
    fill_in 'Email', with: seller.email
    fill_in 'Password', with: seller.password
    click_button 'Log in'
    visit sellers_path if seller.user_type == 'seller'
  end

  def bank_account
    seller = FactoryBot.create :seller
    user = FactoryBot.create :user
    item = FactoryBot.create(:item, seller_id: seller.id)
    order = FactoryBot.create(:order, item_id: item.id, user_id: user.id)
    visit amount_transfer_user_order_bank_accounts_path(user_id: user.id,
                                                        order_id: order.id)
  end
end
