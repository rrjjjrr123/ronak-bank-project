class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id]) 
  end 
  
  def veiw_order
    @orders = current_user.orders
  end 
end
