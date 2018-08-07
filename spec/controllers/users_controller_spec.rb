require 'rails_helper'
RSpec.describe UsersController do
  login_user

  describe 'GET account_details' do
    it 'renders the account_details template' do
      get :account_details
      expect(response).to render_template('account_details')
    end
  end

  describe 'GET account_details' do
    it 'renders the profile template' do
      get :profile
      expect(response).to render_template('profile')
    end
  end
end
