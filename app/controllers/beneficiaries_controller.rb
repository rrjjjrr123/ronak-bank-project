class BeneficiariesController < ApplicationController
  
  def new
    @beneficiary = Beneficiary.new
  end

  def create
    @user = current_user
    @beneficiary = Beneficiary.create(beneficiary_params)
    redirect_to amount_transfer_user_bank_accounts_path(@user)   
  end
   
  def destroy
    @beneficiary = Beneficiary.find(params[:beneficiary_id])
    @beneficiary.destroy
    redirect_to root_path
  end  

  def show 
    @beneficiary = Beneficiary.find(params[:beneficiary_id])
  end 

 private
  def beneficiary_params
    params.require(:beneficiary).permit(:beneficiary_id, :user_id).merge({user_id: current_user.id})
  end
end
