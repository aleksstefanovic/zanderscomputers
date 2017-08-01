class CartsController < ApplicationController
    before_action :authenticate_user! 

    def index
        @carts = []
        @builds = Build.where(:userid => current_user.id)
        @builds.each do |build|
            build[:description] = build[:description][0..100]
            cart = Cart.where(:userid => current_user.id)
            if cart == []
                next
            else
                cart = cart.where(:buildid => build[:id])
                if cart == []
                    next
                end
            end
            build[:id] = cart[:id]
            @carts.push(build)
        end
    end

    def new
        @existingCart = Cart.where(:buildid => params[:buildId])
        if @existingCart == nil
            @cart = Cart.new
            @cart[:userid] = current_user.id
            @cart[:buildid] = params[:buildId]
            @cart.save
            redirect_to carts_path
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
    end


end
