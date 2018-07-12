class SellersController < ApplicationController
  
  before_action :authenticate_seller!
  
  def index
    @sellers = Seller.all
  end  

  def show 
  end 

end
