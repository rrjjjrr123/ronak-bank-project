module Api
  module V1
    class OrdersController < Api::BaseController

      def show
        @order = Order.find(params[:id])
        render json: @order, status: 200 
      end

      def create
        @item = Item.find(params[:item_id])
        if params[:order][:order_confirmation] == "true"
          @order = @item.orders.create!(amount: (@item.price.to_i)*(params[:order][:quantity].to_i), quantity: params[:order][:quantity],user_id: current_user.id)
          render json: @order, status: 201
        else
          head(:unauthorized) 
        end
      end 
    
      def veiw_order
        @orders = current_user.orders
        render json: @orders, status: 200
      end   
    end  
  end  
end  