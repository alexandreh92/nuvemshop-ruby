module Nuvemshop
  class Product < BaseModel
    attr_accessor :id, :depth, :height, :name, :price, :product_id, :image,
                  :quantity, :free_shipping, :weight, :width, :variant_id, :variant_values,
                  :properties, :sku, :barcode

    private

      def after_initialize
        assing_variables
      end

      def assing_variables
        @image = Product::Image.new(image)
      end
  end
end
