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
        @ram = Item.where(:id => @build[:ram]).first
        @cpu = Item.where(:id => @build[:cpu]).first
        @gpu = Item.where(:id => @build[:gpu]).first
        @psu = Item.where(:id => @build[:psu]).first
        @chasis = Item.where(:id => @build[:chasis]).first
    end

    private def build_params
        params.require(:build).permit(:name, :description, :motherboard, :ram, :cpu, :gpu, :psu, :chasis, :userid)
    end
end
