require 'rails_helper' 

describe 'sellers/index.html.erb' do
  let(:seller) {FactoryBot.create(:seller)}
  
  it 'displays seller details', js: true do
    seller_sign_in seller
    page.should have_selector('h1', text: "Welcome #{seller.full_name}")
  end
end
