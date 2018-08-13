# this is users controller
class UsersController < ApplicationController
  
  def profile   
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
   :phone_no, :user_type)
  end
end
