module Nuvemshop
  module Extensions
    module MassAssignment
      def initialize(options = {})
        before_initialize if respond_to?(:before_initialize, true)
        options.each { |key, value| public_send("#{key}=", value) }
        after_initialize if respond_to?(:after_initialize, true)
      end
    end
  end
end
