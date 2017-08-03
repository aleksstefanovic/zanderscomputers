class CartsController < ApplicationController
    before_action :authenticate_user! 

    def index
        @carts = []
        @builds = Build.where(:userid => current_user.id)
        @builds.each do |build|
            build[:description] = build[:description][0..100]
            cart = Cart.where(:userid => current_user.id).where(:buildid => build[:id]).first
            if cart == [] or cart == nil
                next
            end
            @carts.push({ cartid: cart[:id], buildid: build[:id], name: build[:name], description: build[:description] })
        end
    end

    def new
        @existingCart = Cart.where(:buildid => params[:buildId]).first
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
        redirect_to carts_path
    end
    
    def show
        @carts = Cart.where(:userid => current_user.id).destroy_all
    end

end
