class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_cart_count

    def set_cart_count
        @cart_icon = 0
        if current_user
            @cart_icon = 'Cart (' + Cart.where(:userid => current_user.id).count.to_s + ')'
        end
    end
    #before_action :authenticate_user! 

    def not_found
      raise ActionController::RoutingError.new('ITEM NOT FOUND')
    end

end
