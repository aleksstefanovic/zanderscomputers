class ItemsController < ApplicationController
    def index
        @searchQuery = params[:search]
        searchItemType = params[:selected_item_type]
        #searchItemType = ItemType.where("name like ?", "%#{@category}%").first

        @items = Item.where("name like ?", "%#{@searchQuery}%").where(:item_type => searchItemType)
        #if searchItemType != nil
            #searchItemType = searchItemType.id
            #@itemsByCategory = Item.where(:item_type => searchItemType)
            #@items += @itemsByCategory
        #end 

        @items.each do |item|
            Rails.logger.debug("debugging...: " + @item.inspect)
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
