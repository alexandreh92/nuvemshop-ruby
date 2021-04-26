require 'nuvemshop_ruby/version'

module NuvemshopRuby
  class Error < StandardError; end

  class << self
    attr_accessor :api_token, :user_id
    attr_writer :api_version

    def config
      yield self
    end

    def api_version
      @api_version ||= 'v1'
    end
  end
end
