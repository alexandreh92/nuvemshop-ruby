require 'pp'
require 'httparty'

require 'nuvemshop/extensions/credentiable'
require 'nuvemshop/extensions/mass_assignment'

require 'nuvemshop/version'
require 'nuvemshop/response'
require 'nuvemshop/request'
require 'nuvemshop/base_model'
require 'nuvemshop/orders/promotional_discount'
require 'nuvemshop/extras/timestampz'
require 'nuvemshop/order'
require 'nuvemshop/orders'

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
