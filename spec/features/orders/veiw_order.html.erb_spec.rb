require 'rails_helper' 

describe 'orders/veiw_order.html.erb' do
  let(:seller) {FactoryBot.create(:seller)}
  let(:item) {FactoryBot.create(:item, seller_id: seller.id)} 
  let(:user) {FactoryBot.create(:user)}
  
  before do
    sign_in user
  end  
  
  it 'displays order details' do
    visit veiw_order_user_orders_path(user.id)
    page.should have_selector('h2', text: "Previous orders")
  end
end
