module Nuvemshop
  module Extensions
    module MassAssignment
      def initialize(opts = {})
        before_initialize if respond_to?(:before_initialize, true)
        opts&.each { |key, value| public_send("#{key.to_sym}=", value) }
        after_initialize if respond_to?(:after_initialize, true)
      end
    end
  end
end
