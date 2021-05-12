module Nuvemshop
  class Orders < Request
    include Extensions::Credentiable

    # Nuvemshop API Orders path
    PATH = 'orders'.freeze

    # Shows all orders given a store
    # @param [Hash] opts
    # @option opts [String] :access_token Nuvemshop Store access_token
    # @option opts [String] :user_id Nuvemshop Store user_id
    # @option opts [String] :since_id
    # @option opts [String] :status
    # @option opts [String] :channels
    # @option opts [String] :payment_status
    # @option opts [String] :shipping_status
    # @option opts [String] :created_at_min
    # @option opts [String] :created_at_max
    # @option opts [String] :updated_at_min
    # @option opts [String] :updated_at_max
    # @option opts [String] :total_min
    # @option opts [String] :total_max
    # @option opts [String] :customer_ids
    # @option opts [String] :page
    # @option opts [String] :per_page
    # @option opts [String] :fields
    # @option opts [String] :q
    # @option opts [String] :app_id
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
    # @option opts [String] :fields
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
  end
end
