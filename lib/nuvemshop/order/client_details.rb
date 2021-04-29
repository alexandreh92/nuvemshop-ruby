module Nuvemshop
  class Order < BaseModel
    # @attr [String] browser_ip The browser_ip of this object.
    # @attr [String] user_agent The user_agent of this object.
    class ClientDetails < BaseModel
      attr_accessor :browser_ip, :user_agent
    end
  end
end
