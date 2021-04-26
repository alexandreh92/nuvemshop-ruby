module Nuvemshop
  class Product < BaseModel
    class Image < BaseModel
      attr_accessor :id, :product_id, :src, :position, :alt, :created_at, :updated_at
    end
  end
end
