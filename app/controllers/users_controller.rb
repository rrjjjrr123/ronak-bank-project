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

  def show 
  end   

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
    :father_name, :mother_name,:father_occupation,
    :mother_occupation,:phone_no,:user_type,:email)
  end
end
