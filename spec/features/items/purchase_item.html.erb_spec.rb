require 'rails_helper'

describe 'purchase item' do
  
  let(:user) { FactoryBot.create :user}
  
  it 'visits item#purchase_item path', js: true  do
    sign_in user
    first(:link, 'purchase').click
    check('order[order_confirmation]')
    page.select("2", from: "order[quantity]")
    click_button 'Submit'
    page.should have_selector('h2', text: 'Complete your payement')
  end
end 
 