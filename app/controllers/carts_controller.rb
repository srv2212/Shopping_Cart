class CartsController < ApplicationController
    before_action :set_cart, only: %i[show destroy]

    def index
        @carts=Cart.all
    end

    def show
        
        @items=@cart.items.order(created_at: :asc)
    end

    def destroy
        
        @cart.destroy
        redirect_to root_path
    end

    private

    def set_cart
        @cart=Cart.find(params[:id])
    end

    
end