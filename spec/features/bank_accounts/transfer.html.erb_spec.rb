require 'rails_helper'

describe 'otp_confirmation' do
  let(:seller) { FactoryBot.create :seller }
  let(:user) { FactoryBot.create :user }
  let(:item) { FactoryBot.create :item, seller_id: seller.id }
  let(:order) { FactoryBot.create(:order, item_id: item.id, user_id: user.id) }
  let(:transaction) { FactoryBot.create(:transaction) }
  let(:otp) { FactoryBot.create(:otp, transaction_id: transaction.id) }
  it 'visits bank_accounts#otp_confirmation path', js: true do
    sign_in user
    bank_account
    visit otp_confirmation_user_order_bank_accounts_path(user_id: user.id,
                                                         order_id: order.id)
    fill_in 'otp', with: otp.otp
    click_button 'Submit'
    page.should have_selector('h3', text: 'enter your verification code')
  end
end
