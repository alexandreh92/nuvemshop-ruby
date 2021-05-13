module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#payment-status Order/Payment Status
      class FulfillmentStatus
        VALUES = [
          UNPACKED = 'unpacked'.freeze,
          FULFILLED = 'fulfilled'.freeze,
          UNFULFILLED = 'unfulfilled'.freeze
        ].freeze
      end
    end
  end
end
