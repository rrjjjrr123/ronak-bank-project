class UsersController < ApplicationController
  before_action :authenticate_user!  
  
  def index
  end  

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

  def my_account
  end 
  
  def profile
      
  end 

  def update
    if params[:user][:confirmed] == "true"  &&  current_user.customer? || current_user.user?        
      @item_select = 
      current_user.update_attributes(user_type:2)

      redirect_to root_path
    else
      redirect_to user_path     
    end  
  end  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
   :phone_no,:user_type,:confirmed,:item_select)
  end
end
