class UsersController < ApplicationController
  before_action :authenticate_user! 

  def new
  end  

  def show 
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
    params.require(:user).permit(:first_name, :last_name,
    :father_name, :mother_name,:father_occupation,
    :mother_occupation,:phone_no,:user_type,addresses_attributes: 
    [:id,:permanent,:country, :state, :city, :area, 
    :house_no, :street_no, :pin , 
    :address_proof,:_destroy])
  end
end

