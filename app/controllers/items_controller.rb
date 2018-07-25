class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:purchase_item]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
  end  

  def create
    debugger
    current_seller.items.create!(item_params) 
    redirect_to root_path
  end

  def purchase_item
    @item = Item.find(params[:id])  
  end   

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end 
end
