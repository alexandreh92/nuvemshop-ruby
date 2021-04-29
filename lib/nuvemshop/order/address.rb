module Nuvemshop
  class Order < BaseModel
    # @attr [String] address The address of this object.
    # @attr [String] city The city of this object.
    # @attr [String] country The country of this object.
    # @attr [String] position The position of this object.
    # @attr [String] created_at The created_at of this object.
    # @attr [String] default The default of this object.
    # @attr [String] floor The floor of this object.
    # @attr [String] id The id of this object.
    # @attr [String] locality The locality of this object.
    # @attr [String] name The name of this object.
    # @attr [String] number The number of this object.
    # @attr [String] phone The phone of this object.
    # @attr [String] updated_at The updated_at of this object.
    # @attr [String] zipcode The zipcode of this object.
    # @attr [String] province The province of this object.
    # Related to {TiendaNube-Docs Order/Address}[https://github.com/tiendanube/api-docs/blob/master/resources/order.md#address]
    class Address < BaseModel
      attr_accessor :address, :city, :country, :created_at, :default, :floor, :id, :locality,
                    :name, :number, :phone, :province, :updated_at, :zipcode
    end
  end
end
