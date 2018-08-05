require 'rails_helper' 

describe 'sellers/veiw_order.html.erb' do
  let(:seller) {FactoryBot.create(:seller)}
  
  it 'displays seller details' do
    seller_sign_in seller
    visit seller_path(seller.id)
    page.should have_selector('h2', text: "Seller Details")
  end
end
