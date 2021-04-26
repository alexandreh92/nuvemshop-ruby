require 'nuvemshop/version'
require 'nuvemshop/request'
require 'nuvemshop/orders'

module Nuvemshop
  class Error < StandardError; end

  class << self
    attr_accessor :client_id, :client_secret, :store_access_token, :store_user_id
    attr_writer :api_version, :user_agent

    def config
      yield self
    end

    def api_version
      @api_version ||= 'v1'
    end

    def user_agent
      @user_agent ||= 'Nuvemshop Gem(https://github.com/alexandreh92/nuvemshop-ruby)'
    end
  end
end
