require 'rails_helper' 

describe 'users/profile.html.erb' do
  let(:user) {FactoryBot.create(:user)}
  
  it 'displays Account details' do
    sign_in user 
    visit profile_users_path
    page.should have_selector('h2', text: "User Profile")
  end
end
