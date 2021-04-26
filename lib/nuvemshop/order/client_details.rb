module Nuvemshop
  class Order < BaseModel
    class ClientDetails < BaseModel
      attr_accessor :browser_ip, :user_agent
    end
  end
end
