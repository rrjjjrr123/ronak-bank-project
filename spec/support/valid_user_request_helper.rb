require 'rails_helper'
require 'spec_helper'

module ValidUserRequestHelper
  # Signs in a valid user uwing the page.drive.post method
  def sign_in_as_valid_seller_driver
    before(:each) do
    @seller ||= FactoryGirl.create :seller
    page.driver.post seller_session_path, :user => {:email => @seller.email, :password => @seller.password}
  
  end
  end
end
