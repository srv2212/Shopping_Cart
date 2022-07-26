class ItemsController < ApplicationController
    

    def destroy
        #puts(params[:id])
        @item=Item.find(params[:id])
        @item.destroy
        respond_to do |format|
            format.html { redirect_to "/carts/#{params[:id]}", notice: 'Successfully Deleted '}
        end

    end

    def update
        puts "="*100
        puts params[:quantity]
        @item=Item.find(params[:id])
        old_quantity=@item.quantity

        if @item.update(quantity: params[:quantity])
            cart=Cart.find(@item.cart_id)
            cart.update(total: cart.total-(old_quantity*@item.price)+(@item.quantity*@item.price))
            respond_to do |format|
                format.html { redirect_to "/carts/#{params[:id]}",notice: "Item was successfully destroyed" }
                format.json { render json: {status: 200}}
            end
        end
        
    end



end