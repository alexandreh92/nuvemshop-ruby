module Nuvemshop
  module Adapters
    module Orders
      class Create < BaseModel
        attr_accessor :id, :currency, :language, :gateway, :payment_status, :status, :fulfillment_status, :products,
                      :total, :inventory_behaviour, :customer, :note, :billing_address, :shipping_address,
                      :shipping_pickup_type, :shipping, :shipping_option, :shipping_tracking_number,
                      :shipping_cost_customer, :shipping_cost_owner, :send_confirmation_email, :send_fulfillment_email

        private

          def after_initialize
            assing_variables
          end

          def assing_variables
            @customer = Order::Customer.new(customer)
            @billing_address = Order::Address.new(billing_address)
            @shipping_address = Order::Address.new(shipping_address)
          end
      end
    end
  end
end
