module Nuvemshop
  class Customer < BaseModel
    attr_accessor :id, :name, :email, :identification, :phone, :note, :default_address, :addresses, :billing_name,
                  :billing_phone, :billing_address, :billing_number, :billing_floor, :billing_locality,
                  :billing_zipcode, :billing_city, :billing_province, :billing_country, :extra, :total_spent,
                  :total_spent_currency, :last_order_id, :active, :created_at, :updated_at

    private

      def after_initialize
        set_attributes
      end

      def set_attributes
        @default_address = Nuvemshop::Order::Address.new(default_address)
        @addresses = addresses&.map { |addr| Order::Address.new(addr) } || []
      end
  end
end
