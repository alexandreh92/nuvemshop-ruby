module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#inventory-behaviour Order/Inventory Behaviour
      class InventoryBehaviour
        VALUES = [
          BYPASS = 'bypass'.freeze,
          CLAIM = 'claim'.freeze
        ].freeze
      end
    end
  end
end
