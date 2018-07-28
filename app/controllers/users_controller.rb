class UsersController < ApplicationController
  
  before_action :authenticate_user!    

  def account_details
  end 
  
  def profile   
  end   

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
   :phone_no, :user_type)
  end 
end
