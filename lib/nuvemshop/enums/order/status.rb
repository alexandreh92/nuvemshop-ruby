module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#order-status Order/Order Status
      class Status
        VALUES = [
          OPEN = 'open'.freeze,
          CLOSED = 'closed'.freeze,
          CANCELLED = 'cancelled'.freeze
        ].freeze
      end
    end
  end
end
