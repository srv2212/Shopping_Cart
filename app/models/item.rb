class Item < ApplicationRecord
    belongs_to :cart
    delegate :set_total, to: :cart
    after_save :set_total
    after_destroy :set_total

    
    
end
