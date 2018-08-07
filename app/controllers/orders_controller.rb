# this is orders controller
class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    amount = @item.price.to_i
    if params[:order][:order_confirmation].eql?(true)
      @order = @item.orders.create!(amount: amount * params[:order][:quantity],
                                    quantity: params[:order][:quantity])
      redirect_to amount_transfer_user_bank_accounts_path(current_user)
    else
      redirect_to purchase_item_item_path(@item)
    end
  end

  def veiw_order
    @orders = current_user.orders
  end
end
