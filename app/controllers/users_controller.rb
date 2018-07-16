class UsersController < ApplicationController
  
  before_action :authenticate_user!  
 
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admins_path
    else
      render 'new'
    end  
  end  

  def my_account
  end 
  
  def profile   
  end   

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
   :phone_no,:user_type)
  end
end
