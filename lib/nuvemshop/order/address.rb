module Nuvemshop
  class Order < BaseModel
    # @attr [String] first_name The customer's first name. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] last_name The customer's last name. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] address The customer's street. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] city The address's city. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] country The address's country (ISO 3166-1 Format). The default is the store country.
    # @attr [String] position The address's index.
    # @attr [String] created_at The created_at of this object.
    # @attr [Boolean] default The boolean value which indicates if default address or not.
    # @attr [String] complement The address's complement. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] id The id of this object.
    # @attr [String] locality The address's locality. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] number The address's number. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # @attr [String] phone The address's phone number.
    # @attr [String] updated_at The updated_at of this object.
    # @attr [String] zipcode 	The address's postal code. The default is 0000.
    # @attr [String] province The address's province. The defaults are Nao informado for pt_BR and
    #   No informado in every other cases (es_AR, es_MX, es_CO).
    # Related to {TiendaNube-Docs Order/Address}[https://github.com/tiendanube/api-docs/blob/master/resources/order.md#address]
    class Address < BaseModel
      attr_accessor :first_name, :last_name, :address, :city, :country, :created_at, :default, :floor, :id, :locality,
                    :number, :phone, :province, :updated_at, :zipcode
    end
  end
end
