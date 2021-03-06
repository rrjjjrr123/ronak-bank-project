# item controller
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:purchase_item]

  def index
    @items = Item.paginate(page: params[:page], per_page: 3)
  end

  def new
    @item = Item.new
  end

  def create
    current_seller.items.create!(item_params)
    redirect_to root_path
  end

  def purchase_item
    @item = Item.find(params[:id])  
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end
