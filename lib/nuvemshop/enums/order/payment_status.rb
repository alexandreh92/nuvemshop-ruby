module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#payment-status Order/Payment Status
      class PaymentStatus
        VALUES = [
          PENDING = 'pending'.freeze,
          AUTHORIZED = 'authorized'.freeze,
          PAID = 'paid'.freeze,
          VOIDED = 'voided'.freeze,
          REFUNDED = 'refunded'.freeze,
          ABANDONED = 'abandoned'.freeze
        ].freeze
      end
    end
  end
end
