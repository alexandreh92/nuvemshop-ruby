module Nuvemshop
  class Request
    require 'httparty'

    attr_reader :access_token, :user_id, :options

    BASE_URL = 'https://api.tiendanube.com/v1/'.freeze

    def initialize(*block)
      @base_url = "#{BASE_URL}/#{set_store}"
      @headers = set_headers
      yield block if block_given?
      @options = { headers: @headers }
    end

    def get(opts = {})
      perform_request(__method__, opts)
    end

    def post(opts = {})
      perform_request(__method__, opts)
    end

    def put(opts = {})
      perform_request(__method__, opts)
    end

    def delete(opts = {})
      perform_request(__method__, opts)
    end

    private

      def perform_request(method, opts = {})
        HTTParty.send(method.to_sym, path(opts[:action]), merge_options(opts))
      end

      def merge_options(opts = {})
        @options.merge!(body: serialize_hash(opts[:body]), query: serialize_hash(opts[:query]))
      end

      def serialize_hash(params)
        params.keep_if { |_, v| v }.to_json
      end

      def path(action)
        "#{@base_url}/#{action}"
      end

      def set_headers
        {
          "Content-Type": 'application/json',
          'Authentication': "bearer #{set_access_token}",
          'User-Agent': Nuvemshop.user_agent
        }
      end

      def set_access_token
        Nuvemshop.store_access_token || access_token
      end

      def set_store
        Nuvemshop.store_user_id || user_id
      end
  end
end
