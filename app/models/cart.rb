class Cart < ApplicationRecord
    has_many :items, dependent: :destroy
    
    def set_total
        cart=Cart.find(id)
        total=cart.items.sum('price*quantity')
        update(total: total)
    
    end
end
