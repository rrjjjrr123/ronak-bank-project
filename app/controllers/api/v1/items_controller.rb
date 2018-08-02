module Api
  module V1
    class ItemsController < Api::BaseController

      def index
        @items = Item.all
        render json: @items, status: 200
      end

      def new
        @item = Item.new 
        render  json: @item 
      end  

      def create
        @item = current_seller.items.create!(item_params) 
        render  json: @item ,status: 201
      end

      def purchase_item
        @item = Item.find(params[:id])  
        render json: @item 
      end   

      private

      def item_params
        params.require(:item).permit(:title, :description, :price, :image)
      end   
    end  
  end  
end  