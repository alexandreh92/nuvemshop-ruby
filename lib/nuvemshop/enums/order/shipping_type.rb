module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#shipping-type Order/Shipping Type
      class ShippingType
        VALUES = [
          SHIP = 'ship'.freeze,
          PICKUP = 'pickup'.freeze
        ].freeze
      end
    end
  end
end
