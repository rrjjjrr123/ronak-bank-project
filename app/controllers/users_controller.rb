class UsersController < ApplicationController
  before_action :authenticate_user! 
  
  def show
    @user = current_user 
  end 

  def amount_transfer
    @user = current_user

  end 
end
