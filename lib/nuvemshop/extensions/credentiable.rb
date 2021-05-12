module Nuvemshop
  module Extensions
    module Credentiable
      # Extends initializer methods to receive store credentials
      # @param [Hash] opts
      # @option opts [String] :access_token Nuvemshop Store access_token
      # @option opts [String] :user_id Nuvemshop Store user_id
      def initialize(opts = {})
        @access_token = opts[:access_token]
        @user_id = opts[:user_id]
        super
      end
    end
  end
end
