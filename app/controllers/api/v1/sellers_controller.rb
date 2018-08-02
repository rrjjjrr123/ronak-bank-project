module Api
  module V1
    class SellersController < Api::BaseController 

      before_action :authenticate_seller!, except: [:new]
      
      def index  
      end  
      
      def show      
      end 
    end  
  end  
end  