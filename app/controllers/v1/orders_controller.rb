module V1
  class OrdersController < Api::V1::BaseController
    def show
      @order = Order.find(params[:id])
      render json: @order, status: 200
    end

    def create
      @item = Item.find(params[:item_id])
      quantity = params[:quantity].to_i
      @order = @item.orders.create!(amount: @item.price.to_i * quantity)
      if @order.save
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
