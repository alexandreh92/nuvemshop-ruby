require 'pp'
require 'httparty'

require 'nuvemshop/extensions/credentiable'
require 'nuvemshop/extensions/mass_assignment'

require 'nuvemshop/version'
require 'nuvemshop/response'
require 'nuvemshop/request'
require 'nuvemshop/base_model'
require 'nuvemshop/extras/timestampz'

require 'nuvemshop/order'
require 'nuvemshop/order/promotional_discount'
require 'nuvemshop/order/payment_details'
require 'nuvemshop/order/timestampz'
require 'nuvemshop/order/address'
require 'nuvemshop/order/client_details'
require 'nuvemshop/product/image'
require 'nuvemshop/product'
require 'nuvemshop/orders'
require 'nuvemshop/customer'

module Nuvemshop
  # Wraps any error outside {Request} methods
  class Error < StandardError; end

  class << self
    attr_writer :user_agent, :store_access_token, :store_user_id, :client_id, :client_secret

    # Default method to setup Nuvemshop
    def configure
      yield self
    end
  end
end
