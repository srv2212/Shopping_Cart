class ItemsController < ApplicationController
    before_action :set_cart, only: %i[ destroy update ]
    

    def destroy
        @item=@cart.items.find(params[:id])
        puts "*"*100
        @item.destroy
        respond_to do |format|
            flash[:notice] = "Item was successfuly deleted"
            format.html { redirect_to cart_path(@cart) }
        end

    end

    def update
        @item=@cart.items.find(params[:id])
        
        respond_to do |format|
            if @item.update(quantity: params[:quantity])
                flash[:notice]="Item was successfully updated"
                format.json { render json: {status: 200}}
            else
                flash[:notice]="Item was not updated"
                format.json {render json: {status: 501}}
            end    
        end
        
    end

    private

    def set_cart
        puts "-"*100
        puts params[:id]
        puts params[:cart_id]
        @cart=Cart.find(params[:cart_id])
    end



end
