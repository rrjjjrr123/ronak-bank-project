class SellersController < ApplicationController  
  before_action :authenticate_seller!, except: [:new]
end
