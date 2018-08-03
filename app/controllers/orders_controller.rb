class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    render json: @order  
  end

  def create
    @item = Item.find(params[:item_id])
    if params[:order][:order_confirmation] == "true"
      @order = @item.orders.create!(amount: (@item.price.to_i)*(params[:order][:quantity].to_i), quantity: params[:order][:quantity],user_id: current_user.id)
      redirect_to amount_transfer_user_order_bank_accounts_path(current_user,@order, format: json)
    else
      redirect_to  purchase_item_item_path(@item,format: json) 
    end
  end 
    
  def veiw_order
    @orders = current_user.orders
    render json: @orders
  end 
end
