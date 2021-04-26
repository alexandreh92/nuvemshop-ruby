module Nuvemshop
  class Order < BaseModel
    class PaymentDetails < BaseModel
      attr_accessor :method, :credit_card_company, :installments
    end
  end
end
