module Nuvemshop
  class Product < BaseModel
    # @attr [String] id The id of this object.
    # @attr [String] product_id The product_id of this object.
    # @attr [String] src The src of this object.
    # @attr [String] position The position of this object.
    # @attr [String] alt The alt of this object.
    # @attr [String] created_at The created_at of this object.
    # @attr [String] updated_at The updated_at of this object.
    class Image < BaseModel
      attr_accessor :id, :product_id, :src, :position, :alt, :created_at, :updated_at
    end
  end
end
