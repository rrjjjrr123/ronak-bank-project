require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new    
  end


  test "email should be required" do  
    @user.valid?
    assert_includes(@user.errors[:email], "can’t be blank")  
  end  
end
