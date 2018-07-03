class UsersController < ApplicationController
  before_action :authenticate_user! 
  
  def show
    @user = current_user 
  end

  def create
    user = @user.new(user_params)
    if user.save
      redirect_to @user
    else
      redirect_to @user
    end  
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
