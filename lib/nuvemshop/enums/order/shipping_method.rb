module Nuvemshop
  module Enums
    module Order
      # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#shipping-method Order/Shipping Method
      class ShippingMethod
        VALUES = [
          BRANCH = 'branch'.freeze,
          CORREIOS = 'correios'.freeze,
          CORREO_ARGENTINO = 'correo-argentino'.freeze,
          OCA_PARTNER_AR = 'oca-partner-ar'.freeze,
          TABLE = 'table'.freeze,
          NOT_PROVIDED = 'not-provided'.freeze
        ].freeze
      end
    end
  end
end
