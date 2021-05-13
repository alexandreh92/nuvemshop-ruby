module Nuvemshop
  class Order < BaseModel
    # @attr [String] name The customer's name. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] email The customer's email address. The defaults are email@naoinformado.com for pt_BR and
    #   email@noinformado.com in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] phone The customer's phone number
    # @attr [String] document The customer's document number
    # Related to {TiendaNube-Docs Order/Customer}[https://github.com/tiendanube/api-docs/blob/master/resources/order.md#customer]
    class Customer < BaseModel
      attr_accessor :name, :email, :phone, :document
    end
  end
end
