class AdminsController < ApplicationController

  def index
    @user = current_user
    @users = User.where(approved: false)
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attributes(approved_by: current_user.user_type,approved: true)
    redirect_to new_user_session_path  
  end
end