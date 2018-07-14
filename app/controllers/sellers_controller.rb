class SellersController < ApplicationController
  
  before_action :authenticate_seller!
  
  def index
<<<<<<< HEAD
    @sellers = Seller.all
=======
>>>>>>> 07e072873bb9a5a81f41dbb145d4e87de7b0c867
  end  

  def show 
  end 

<<<<<<< HEAD
=======
  def new 
    @seller = Seller.new
  end  

  def create  
  
  end

>>>>>>> 07e072873bb9a5a81f41dbb145d4e87de7b0c867
end
