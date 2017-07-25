class BuildsController < ApplicationController
    def index
        @builds = Build.where(:userid => current_user.id)
    end
    
    def new
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
            @motherboard = {"name":"", "description":""}
        end

        @ram = Item.where(:id => @build[:ram]).first
        if @ram == nil
            @ram = {"name":"", "description":""}
        end

        @cpu = Item.where(:id => @build[:cpu]).first
        if @cpu == nil
            @cpu = {"name":"", "description":""}
        end

        @gpu = Item.where(:id => @build[:gpu]).first
        if @gpu == nil
            @gpu = {"name":"", "description":""}
        end

        @psu = Item.where(:id => @build[:psu]).first
        if @psu == nil
            @psu = {"name":"", "description":""}
        end

        @chasis = Item.where(:id => @build[:chasis]).first
        if @chasis == nil
            @chasis = {"name":"", "description":""}
        end
    end

    private def build_params
        params.require(:build).permit(:name, :description, :motherboard, :ram, :cpu, :gpu, :psu, :chasis, :userid)
    end
end
