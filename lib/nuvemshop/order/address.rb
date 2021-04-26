module Nuvemshop
  class Order < BaseModel
    class Address < BaseModel
      attr_accessor :address, :city, :country, :created_at, :default, :floor, :id, :locality,
                    :name, :number, :phone, :province, :updated_at, :zipcode
    end
  end
end
