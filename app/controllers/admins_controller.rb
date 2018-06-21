class AdminsController < ApplicationController
  
  def index
    @users = User.where(approved: false)
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attributes(approved: true)
  end
end  