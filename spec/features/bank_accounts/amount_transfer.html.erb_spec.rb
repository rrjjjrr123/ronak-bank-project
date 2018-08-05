require 'rails_helper'

describe 'amount_transfer' do
  let(:user){ FactoryBot.create(:user)}   
  
  it 'visits bank_accounts#amount_transfer path', js: true  do
    sign_in user
    bank_account
    fill_in "debit_acc", with: BankAccount.first.account_number
    click_button 'Submit'
    page.should have_selector('h3', text: 'enter your verification code')
  end
end 
 