require 'rails_helper'
describe 'new item' do
  let(:item) { FactoryBot.create :item }
  let(:seller) { FactoryBot.create :seller }
  it 'visits sellers#index path', js: true do
    seller_sign_in seller
    click_on 'Add Listing'
    fill_in 'Title', with: item.title
    fill_in 'Description', with: item.description
    fill_in 'Price', with: item.price
    click_button 'Create Item'
    expect(page).to have_content 'Welcome to the online e-commerce website'
  end
end
