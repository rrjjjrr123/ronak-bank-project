require 'rails_helper'
 
describe 'e-commerce' do

  let(:user) { FactoryBot.create :user}
  
  describe 'root path', js: true do 
    it 'visit root path' do
      visit items_path 
      expect(page).to have_content 'Welcome to the online e-commerce website'
    end
  end   

  describe "purchase link", js: true do

    before do
      sign_in user
    end
    it "visit root path and click on purchase link" do
      visit root_path 
      first(:link, 'purchase').click
      page.should have_selector('h3', text: "Confirm your Order")
    end
  end  

  # describe "successfull logout", js: true do             
    
  #   before do
  #     sign_in user
  #   end  

  #   it "logs out the user" do
  #     visit root_path
  #     click_on 'Log out'
  #     expect(page).to have_content 'Welcome to the online e-commerce website'
  #   end
  # end 

  # describe "links to seller path", js: true do     
  #   it "login of seller" do
  #     visit root_path
  #     first(:link, 'Sell on e-commerce').click
  #      # click_on 'Sell on e-commerce'
  #     page.should have_selector('h2', text: 'Log in')
  #   end
  # end

  # describe "it links to sign up of user", js: true do     
  #   it "sign up for the new user" do
  #     visit root_path
  #     first(:link, 'Signup').click
  #     # click_on 'Signup'
  #     page.should have_selector('h2', text: 'Sign up')
  #   end
  # end
end  