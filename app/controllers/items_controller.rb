class ItemsController < ApplicationController
    def index
        @items = Item.all
        @items.each do |item|
            item[:item_type] = ItemType.where(:id => item[:item_type]).first.name
        end
    end
    
    def new
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to @item
    end

    def show
        @item = Item.find(params[:id])
        @item[:item_type] = ItemType.where(:id => @item[:item_type]).first.name
    end

    private def item_params
        params.require(:item).permit(:name, :description, :item_type)
    end
end
