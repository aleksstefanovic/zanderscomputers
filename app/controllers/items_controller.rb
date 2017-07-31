class ItemsController < ApplicationController
    def index
        @searchQuery = params[:search]
        searchItemType = params[:selected_item_type]

        if searchItemType == nil or searchItemType == ""
            @items = Item.where("name like ?", "%#{@searchQuery}%").order ('name ASC')
        else 
            @items = Item.where("name like ?", "%#{@searchQuery}%").where(:item_type => searchItemType).order ('name ASC')
        end 

        @items.each do |item|
            item[:item_type] = ItemType.where(:id => item[:item_type]).first.name
            item[:description] = item[:description][0..50]
            if item[:image] == nil
                item[:image] = "NA.png"
            end
        end
    end
    
    def new
        if current_user == nil
            redirect_to new_user_session_path
        end
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to @item
    end

    def show
        @item = Item.find(params[:id]) or not_found
        @item[:item_type] = ItemType.where(:id => @item[:item_type]).first.name
        if @item.image == nil
            @item.image = "NA.png"
        end
    end

    private def item_params
        params.require(:item).permit(:name, :image, :description, :item_type)
    end
end
