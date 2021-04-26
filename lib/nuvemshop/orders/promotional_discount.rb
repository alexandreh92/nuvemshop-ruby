module Nuvemshop
  class PromotionalDiscount < BaseModel
    attr_accessor :id, :store_id, :order_id, :created_at, :total_discount_amount, :contents,
                  :promotions_applied
  end
end
