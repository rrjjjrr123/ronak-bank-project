# this is orders controller
class OrdersController < ApplicationController
  def show
    debugger
    @order = Order.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    if @item
      @order = @item.orders.create!(amount: (@item.price.to_i)*(params[:order][:quantity].to_i), quantity: params[:order][:quantity],user_id: current_user.id)
      redirect_to amount_transfer_user_bank_accounts_path(current_user,@order.id)
    else
      redirect_to purchase_item_item_path(@item)
    end
  end

  def veiw_order
    @orders = current_user.orders
  end
end
