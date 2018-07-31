 require 'rails_helper' 

describe 'orders/show.html.erb' do
  let(:user) {FactoryBot.create(:user)}
  let(:seller) {FactoryBot.create(:seller)}
  let(:item) {FactoryBot.create(:item, seller_id: seller.id)}

  before do
    sign_in user
  end  
  it 'displays order details' do
    assign(:order, FactoryBot.create(:order, item_id: item.id, user_id: user.id))
    render
    rendered.should contain('500')
    rendered.should contain('3')
    rendered.should contain('1')
    rendered.should contain('2')
  end
end
