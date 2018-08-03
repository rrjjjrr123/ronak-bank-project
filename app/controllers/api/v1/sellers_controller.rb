module Api
  module V1
    class SellersController < Api::BaseController     
      before_action :authenticate_seller! 
    end  
  end  
end  