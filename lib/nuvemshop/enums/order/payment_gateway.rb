module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#payment-gateway Order/Payment Gateway
      class PaymentGateway
        VALUES = [
          OFFLINE = 'offline'.freeze,
          MERCADOPAGO = 'mercadopago'.freeze,
          PAGSEGURO = 'pagseguro'.freeze,
          CIELO = 'cielo'.freeze,
          MOIP = 'moip'.freeze,
          PAYU = 'payu'.freeze,
          TODOPAGO = 'todopago'.freeze,
          NOT_PROVIDED = 'not-provided'.freeze
        ].freeze
      end
    end
  end
end
