class SellersController < ApplicationController
  
  before_action :authenticate_seller!
  
  def index
  end  

  def show 
    @seller = Seller.find(params[:id]) 
  end 

  def new 
    @seller = Seller.new
  end  

  def create  
  
  end

end
