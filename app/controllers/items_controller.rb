class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:purchase_item]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
  end  

  def create
    @item = current_seller.items.create!(item_params) 
    redirect_to root_path
  end

  def purchase_item
    @item = Item.find(params[:id])  
  end

  def update
    @item = Item.find(params[:id])
    if params[:item][:order_confirmation] == "true"
      @order = @item.orders.create!(amount: (@item.price.to_i)*(params[:item][:quantity].to_i), quantity: params[:item][:quantity],user_id: current_user.id)
      redirect_to amount_transfer_user_order_bank_accounts_path(current_user,@order)
    else

    end     
  end   

  private

  def item_params
    params.require(:item).permit(:title,:description,:price,:image)
  end 
end
