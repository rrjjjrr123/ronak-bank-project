module V1
  # this is api for items
  class ItemsController < V1::BaseController
    def index
      @items = Item.all
      render json: @items, status: 200
    end

    def new
      @item = Item.new
      render json: @item, status: 200
    end

    def create
      @item = current_seller.items.create!(item_params)
      if @item
        render json: @item, status: 201
      else
        render json: { status: 'error' }
      end
    end

    def purchase_item
      @item = Item.find(params[:id])
      render json: @item, status: 200
    end

    private

    def item_params
      params.require(:item).permit(:title, :description, :price, :image)
    end
  end
end
