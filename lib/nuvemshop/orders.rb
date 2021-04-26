module Nuvemshop
  class Orders < Request
    def initialize(opts = {})
      @access_token = opts[:access_token]
      super
    end
  end
end
