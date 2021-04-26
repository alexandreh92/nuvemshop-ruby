module Nuvemshop
  class Order < BaseModel
    attr_accessor :id, :token, :store_id, :shipping_min_days, :shipping_max_days, :billing_name, :billing_phone,
                  :billing_address, :billing_number, :billing_floor, :billing_locality, :billing_zipcode, :billing_city,
                  :billing_province, :billing_country, :shipping_cost_owner, :shipping_cost_customer, :coupon,
                  :promotional_discount, :subtotal, :discount, :discount_coupon, :discount_gateway, :total,
                  :total_usd, :checkout_enabled, :weight, :currency, :language, :gateway, :gateway_id, :shipping,
                  :shipping_option, :shipping_option_code, :shipping_option_reference, :shipping_pickup_details,
                  :shipping_tracking_number, :shipping_tracking_url, :shipping_store_branch_name, :shipping_pickup_type,
                  :shipping_suboption, :extra, :storefront, :note, :created_at, :updated_at, :completed_at,
                  :next_action, :payment_details, :attributes, :customer, :products, :number, :cancel_reason,
                  :owner_note, :cancelled_at, :closed_at, :read_at, :status, :payment_status, :shipping_address,
                  :shipping_status, :shipped_at, :paid_at, :landing_url, :client_details, :app_id

    private

      def after_initialize
        @promotional_discount = PromotionalDiscount.new(promotional_discount)
      end
  end
end
