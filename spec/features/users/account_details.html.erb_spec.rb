require 'rails_helper'
describe 'users/account_details.html.erb' do
  let(:user) { FactoryBot.create(:user) }
  it 'displays Account details' do
    sign_in user
    visit account_details_users_path
    page.should have_selector('h2', text: 'Account Details')
  end
end
