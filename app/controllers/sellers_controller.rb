class SellersController < ApplicationController
  
  before_action :authenticate_seller!
  
  def index
  end  

  def show 
  end 

  def new 
    @seller = Seller.new
  end  

  def create  
  
  end

end
