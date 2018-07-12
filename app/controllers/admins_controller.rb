class AdminsController < ApplicationController

  def index     
    @users = users.order(:created_at).where(approved: false)
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attributes(approved_by: current_user.user_type, approved: true)
    redirect_to new_user_session_path  
  end
end