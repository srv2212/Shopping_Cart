class CartsController < ApplicationController
    def index
        @carts=Cart.all
    end

    def show
        @cart=Cart.find(params[:id])
        @items=@cart.items.order(created_at: :asc)
    end

    def destroy
        @cart=Cart.find(params[:id])
        @cart.destroy
        redirect_to root_path
    end

    
end