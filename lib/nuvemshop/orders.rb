module Nuvemshop
  class Orders < Request
    include Extensions::Credentiable

    # Nuvemshop API Orders path
    PATH = 'orders'.freeze

    # Shows all orders given a store
    # @param [Hash] opts
    # @option opts [String] :access_token Nuvemshop Store access_token
    # @option opts [String] :user_id Nuvemshop Store user_id
    # @option opts [String] :since_id Restrict results to after the specified ID
    # @option opts [String] :status Show Orders with a given state. Possible values are "any" (default), "open",
    #   "closed" or "cancelled"
    # @option opts [String] :channels Restrict results to the specified sales channel. Possible values are
    #   "form" (draft order created via admin or API), "store" (order created in the storefront), "api"
    #   (order created via API - doesn't include draft orders) or "meli" (order imported from Mercado Libre)
    # @option opts [String] :payment_status Show Orders with a given payment state. Possible values are "any"
    #   (default), "pending", "authorized", "paid", "abandoned", "refunded" or "voided"
    # @option opts [String] :shipping_status Show Orders with a given shipping state. Possible values are "any"
    #   (default), "unpacked", "unfulfilled" (means "unshipped") or "fulfilled" (means "shipped")
    # @option opts [String] :created_at_min Show Orders created after date (ISO 8601 format)
    # @option opts [String] :created_at_max Show Orders created before date (ISO 8601 format)
    # @option opts [String] :updated_at_min Show Orders last updated after date (ISO 8601 format)
    # @option opts [String] :updated_at_max Show Orders last updated before date (ISO 8601 format)
    # @option opts [String] :total_min Show Orders with total value bigger or equals than the specified value
    # @option opts [String] :total_max Show Orders with total value lower or equals than the specified value
    # @option opts [String] :customer_ids Restrict results to the specified customer IDs (comma-separated)
    # @option opts [String] :page Page to show
    # @option opts [String] :per_page Amount of results
    # @option opts [String] :fields Comma-separated list of fields to include in the response
    # @option opts [String] :q Search Orders by the given number; or containing the given text in the customer
    #   name or email
    # @option opts [String] :app_id Show Orders created by a given app
    # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#get-orders Nuvemshop GET /orders
    def self.all(opts = {})
      response = new(
        access_token: opts[:access_token],
        user_id: opts[:user_id]
      ).get(
        action: PATH,
        query: {
          since_id: opts[:since_id],
          status: opts[:status],
          channels: opts[:channels],
          payment_status: opts[:payment_status],
          shipping_status: opts[:shipping_status],
          created_at_min: opts[:created_at_min],
          created_at_max: opts[:created_at_max],
          updated_at_min: opts[:updated_at_min],
          updated_at_max: opts[:updated_at_max],
          total_min: opts[:total_min],
          total_max: opts[:total_max],
          customer_ids: opts[:customer_ids],
          page: opts[:page],
          per_page: opts[:per_page],
          fields: opts[:fields],
          q: opts[:q],
          app_id: opts[:app_id]
        }
      )

      respond_with(response, Nuvemshop::Order)
    end

    # Shows a single order given an order_id
    # @param [Hash] opts
    # @option opts [String] :fields Comma-separated list of fields to include in the response
    # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#get-ordersid Nuvemshop GET /orders/{id}
    def self.show(opts = {})
      response = new(
        access_token: opts[:access_token],
        user_id: opts[:user_id]
      ).get(
        action: "#{PATH}/#{opts[:order_id]}",
        query: {
          fields: opts[:fields]
        }
      )

      respond_with(response, Nuvemshop::Order)
    end

    # Creates an order
    # @param [Hash] opts
    # @option opts [String] :currency The order currency code (ISO 4217 format). The default is the store currency.
    # @option opts [String] :language The language code (ISO 639-1 format). The default is the store main language.
    # @option opts [Enums::Order::PaymentGateway] :gateway The order's payment gateway.
    #   The default is not-provided.
    # @option opts [Enums::Order::PaymentStatus] :payment_status The order's payment status. The default is paid.
    # @option opts [Enums::Order::Status] :status The order's status. The default is open.
    # @option opts [Enums::Order::FulfillmentStatus] :fulfillment_status The order's fulfill status.
    #   The default is unpacked.
    # @option opts [String] :total The sum of all products prices, shipping costs and discounts. Must be positive.
    #   If not specified, it's calculated considering the provided costs and discounts.
    # @option opts [Enums::Order::InventoryBehaviour] :inventory_behaviour The inventory behaviour
    #   that the order must perform
    # @option opts [Order::Customer] :customer The customer object
    # @option opts [String] :note An additional customer note for the order.
    # @option opts [Order::Address] :billing_address
    # @option opts [Order::Address] :shipping_address
    # @option opts [Enums::Order::ShippingType] :shipping_pickup_type
    # @option opts [Enums::Order::ShippingMethod] :shipping
    # @option opts [String] :shipping_option The order's shipping option nice name. The defaults are Nao informado
    #   for pt_BR and No informado in every other cases (es_AR, es_MX, es_CO).
    # @option opts [String] :shipping_tracking_number The order's shipping tracking number
    # @option opts [Number] :shipping_cost_customer The customer's shipping cost double value.
    #   The value 0 means free shipping. The default is 0.
    # @option opts [String] :shipping_cost_owner The owner's shipping cost double value.
    # @option opts [String] :send_confirmation_email Send the order confirmation email to the customer.
    #   The default is false.
    # @option opts [String] :send_fulfillment_email Send the order fulfillment email to the customer.
    #   The default is false.
    # @see https://github.com/tiendanube/api-docs/blob/master/resources/order.md#post-orders Nuvemshop POST /orders
    def self.create(opts = {})
      response = new(
        access_token: opts[:access_token],
        user_id: opts[:user_id]
      ).post(
        action: PATH,
        body: {
          currency: opts[:currency],
          language: opts[:language],
          gateway: opts[:gateway],
          payment_status: opts[:payment_status],
          status: opts[:status],
          fulfillment_status: opts[:fulfillment_status],
          products: opts[:products],
          total: opts[:total],
          inventory_behaviour: opts[:inventory_behaviour],
          customer: opts[:customer],
          note: opts[:note],
          billing_address: opts[:billing_address],
          shipping_address: opts[:shipping_address],
          shipping_pickup_type: opts[:shipping_pickup_type],
          shipping: opts[:shipping],
          shipping_option: opts[:shipping_option],
          shipping_tracking_number: opts[:shipping_tracking_number],
          shipping_cost_customer: opts[:shipping_cost_customer],
          shipping_cost_owner: opts[:shipping_cost_owner],
          send_confirmation_email: opts[:send_confirmation_email],
          send_fulfillment_email: opts[:send_fulfillment_email]
        }
      )

      respond_with(response, Nuvemshop::Order)
    end
  end
end
