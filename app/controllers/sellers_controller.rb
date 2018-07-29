class SellersController < ApplicationController
  
  before_action :authenticate_seller!, except: [:new]
  
  def index   
  end  

  def show      
  end 
    
end
