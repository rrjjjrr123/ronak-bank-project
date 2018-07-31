require 'rails_helper'

describe 'new item' do
  let(:item)  { FactoryBot.create :item}
  let(:seller)  { FactoryBot.create :seller}
  
  before do
    sign_in seller
  end
  
  it 'visits item#new path' do
    click_on 'Add Listing'
    fill_in "title", with: 'item.title'
  end
end   
   