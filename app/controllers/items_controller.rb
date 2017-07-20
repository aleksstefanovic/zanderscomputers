class ItemsController < ApplicationController
    def new
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to @item
        #render plain: params[:item].inspect
    end

    private def item_params
        params.require(:item).permit(:name, :description, :item_type)
    end
end
