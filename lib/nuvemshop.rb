require 'pp'
require 'httparty'

require 'nuvemshop/inflections/infer_key_class_name'
require 'nuvemshop/inflections/pascal_case'

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
  class Error < StandardError; end

  class << self
    attr_accessor :client_id, :client_secret
    attr_writer :api_version, :user_agent, :store_access_token, :store_user_id

    def config
      yield self
    end

    def api_version
      @api_version ||= 'v1'
    end

    def user_agent
      @user_agent ||= 'Nuvemshop Gem(https://github.com/alexandreh92/nuvemshop-ruby)'
    end

    def store_user_id
      @store_user_id ||= nil
    end

    def store_access_token
      @store_access_token ||= nil
    end
  end
end
