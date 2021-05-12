module Nuvemshop
  class Order < BaseModel
    # @attr [String] method The method of this object.
    # @attr [String] credit_card_company The credit_card_company of this object.
    # @attr [String] installments The installments of this object.
    class PaymentDetails < BaseModel
      attr_accessor :method, :credit_card_company, :installments
    end
  end
end
