 require 'rails_helper' 

describe 'orders/show.html.erb' do
let(:user) {FactoryBot.create(:user)} 

  before do
    sign_in user
  end  
  
  it 'displays order details' do
    visit user_order_path(user.id)
    page.should have_selector('h1', text: "Order Details")
  end
end
