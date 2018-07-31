require 'rails_helper'

describe 'new item' do
  
  let(:user) { FactoryBot.create :user}
  
  before do
    sign_in user
  end
  
  it 'visits item#purchase_item path' do
    page.check 'confirm your order'
    page.select("2", :from => "item_quantity")
    click_button 'Submit'
    page.should have_selector('h2', text: 'Complete your payement')
  end
end 
 