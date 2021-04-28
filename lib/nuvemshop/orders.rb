module Nuvemshop
  class Orders < Request
    include Extensions::Credentiable

    PATH = 'orders'.freeze

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
