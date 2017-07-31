class BuildsController < ApplicationController
    before_action :authenticate_user! 
    def index
        @builds = Build.where(:userid => current_user.id)
        @builds.each do |build|
            build[:description] = build[:description][0..100]
        end
    end
    
    def new
    end

    def edit
        @build = Build.find(params[:id]) 
        @item = Item.find(params[:itemId])
        @item_type = @item[:item_type]

        if @item_type == '1'
            @build[:motherboard] = params[:itemId]
        elsif @item_type == '2'
            @build[:ram] = params[:itemId]
        elsif @item_type == '3'
            @build[:cpu] = params[:itemId]
        elsif @item_type == '4'
            @build[:gpu] = params[:itemId]
        elsif @item_type == '5'
            @build[:psu] = params[:itemId]
        elsif @item_type == '6'
            @build[:chasis] = params[:itemId]
        end
   
        @build.save
        redirect_to @build
    end

    def create
        @build = Build.new(build_params)
        @build[:userid] = current_user.id
        @build.save
        redirect_to @build
    end

    def show
        @build = Build.find(params[:id])

        @motherboard = Item.where(:id => @build[:motherboard]).first
        if @motherboard == nil
            @motherboard = {"name":"", "description":"", "image":"NA.png"}
        elsif @motherboard[:image] == nil
            @motherboard[:image] = "NA.png"
        end

        @ram = Item.where(:id => @build[:ram]).first
        if @ram == nil
            @ram = {"name":"", "description":"", "image":"NA.png"}
        elsif @ram[:image] == nil
            @ram[:image] = "NA.png"
        end

        @cpu = Item.where(:id => @build[:cpu]).first
        if @cpu == nil
            @cpu = {"name":"", "description":"", "image":"NA.png"}
        elsif @cpu[:image] == nil
            @cpu[:image] = "NA.png"
        end

        @gpu = Item.where(:id => @build[:gpu]).first
        if @gpu == nil
            @gpu = {"name":"", "description":"", "image":"NA.png"}
        elsif @gpu[:image] == nil
            @gpu[:image] = "NA.png"
        end

        @psu = Item.where(:id => @build[:psu]).first
        if @psu == nil
            @psu = {"name":"", "description":"", "image":"NA.png"}
        elsif @psu[:image] == nil
            @psu[:image] = "NA.png"
        end

        @chasis = Item.where(:id => @build[:chasis]).first
        if @chasis == nil
            @chasis = {"name":"", "description":"", "image":"NA.png"}
        elsif @chasis[:image] == nil
            @chasis[:image] = "NA.png"
        end
    end

    private def build_params
        params.require(:build).permit(:name, :description, :motherboard, :ram, :cpu, :gpu, :psu, :chasis, :userid)
    end
end
