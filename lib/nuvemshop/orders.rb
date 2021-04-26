module Nuvemshop
  class Orders < Request
    def initialize(opts = {})
      @access_token = opts[:access_token]
      @user_id = opts[:user_id]
      super
    end
  end
end
