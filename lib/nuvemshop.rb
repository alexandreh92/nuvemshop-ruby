require 'pp'
require 'httparty'

require 'nuvemshop/extensions/credentiable'
require 'nuvemshop/extensions/mass_assignment'

require 'nuvemshop/version'
require 'nuvemshop/response'
require 'nuvemshop/request'
require 'nuvemshop/base_model'
require 'nuvemshop/extras/timestampz'

require 'nuvemshop/enums/order/fulfillment_status'
require 'nuvemshop/enums/order/inventory_behaviour'
require 'nuvemshop/enums/order/payment_gateway'
require 'nuvemshop/enums/order/payment_status'
require 'nuvemshop/enums/order/shipping_method'
require 'nuvemshop/enums/order/shipping_type'
require 'nuvemshop/enums/order/status'

require 'nuvemshop/request_helpers/orders/create'

require 'nuvemshop/order'
require 'nuvemshop/order/promotional_discount'
require 'nuvemshop/order/payment_details'
require 'nuvemshop/order/timestampz'
require 'nuvemshop/order/address'
require 'nuvemshop/order/client_details'
require 'nuvemshop/order/customer'
require 'nuvemshop/product/image'
require 'nuvemshop/product'
require 'nuvemshop/orders'
require 'nuvemshop/customer'

module Nuvemshop
  # Wraps any error outside {Request} methods
  class Error < StandardError; end

  class << self
    attr_accessor :store_access_token, :store_user_id, :client_id, :client_secret
    attr_writer :user_agent

    # Default method to setup Nuvemshop
    def configure
      yield self
    end

    # Sets default user agent. Required from NuvemShop
    def user_agent
      @user_agent ||= 'Nuvemshop Gem(https://github.com/alexandreh92/nuvemshop-ruby)'
    end
  end
end
