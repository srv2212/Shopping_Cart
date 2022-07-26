class ItemsController < ApplicationController
    before_action :set_item, only: %i[ destroy update ]
    

    def destroy
        @item.destroy
        respond_to do |format|
            flash[:notice] = "Item was successfuly deleted"
            format.html { redirect_to "/carts/#{params[:id]}"}
        end

    end

    def update
        old_quantity=@item.quantity

        if @item.update(quantity: params[:quantity])
            cart=Cart.find(@item.cart_id)
            cart.update(total: cart.total-(old_quantity*@item.price)+(@item.quantity*@item.price))
            respond_to do |format|
                flash[:notice]="Item was successfully updated"
                format.json { render json: {status: 200}}
            end
        end
        
    end

    private

    def set_item
        @item=Item.find(params[:id])
    end



end