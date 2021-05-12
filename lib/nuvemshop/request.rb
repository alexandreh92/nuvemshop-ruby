module Nuvemshop
  class Request
    # Wraps any unsuccessfull request error
    class Error < StandardError; end

    include HTTParty

    attr_accessor :response
    attr_reader :access_token, :user_id, :options

    # Nuvemshop API URL
    BASE_URL = 'https://api.tiendanube.com/v1'.freeze

    # Receives any instance variables and reset if needed.
    # If :access_token or :user_id are missing, values set in the configuration
    # will be used
    def initialize(*block)
      @base_url = "#{BASE_URL}/#{set_store}"
      @headers = set_headers
      yield block if block_given?
      @options = { headers: @headers }
    end

    # Exec HTTP GET request with {perform_request} params
    def get(opts = {})
      perform_request(__method__, opts)
    end

    # Exec HTTP POST request with {perform_request} params
    def post(opts = {})
      perform_request(__method__, opts)
    end

    # Exec HTTP PUT request with {perform_request} params
    def put(opts = {})
      perform_request(__method__, opts)
    end

    # Exec HTTP DELETE request with {perform_request} params
    def delete(opts = {})
      perform_request(__method__, opts)
    end

    # Responds request with formatted {Response}
    def self.respond_with(response, formatter)
      Response.new(response, formatter)
    end

    private

      def perform_request(method, opts = {})
        response = self.class.send(method.to_sym, path(opts[:action]), merge_options(opts))

        raise Error, response unless response.success?

        response
      end

      def merge_options(opts = {})
        @options.merge!(body: serialize_hash(opts[:body]), query: sanitize_hash(opts[:query]))
      end

      def serialize_hash(opts = {})
        return unless opts

        sanitize_hash(opts).to_json
      end

      def sanitize_hash(opts = {})
        opts.keep_if { |_, v| v }
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
        access_token || Nuvemshop.store_access_token
      end

      def set_store
        user_id || Nuvemshop.store_user_id
      end
  end
end
