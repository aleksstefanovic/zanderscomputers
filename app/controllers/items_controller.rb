class ItemsController < ApplicationController
    def index
        @searchQuery = params[:search]
        searchItemType = params[:selected_item_type]

        @items = Item.where("name like ?", "%#{@searchQuery}%").where(:item_type => searchItemType)
        if searchItemType == nil
            @items = Item.all.order ('name ASC')
        end 

        @items.each do |item|
            Rails.logger.debug("debugging...: " + @item.inspect)
            item[:item_type] = ItemType.where(:id => item[:item_type]).first.name
            item[:description] = item[:description][0..50]
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
