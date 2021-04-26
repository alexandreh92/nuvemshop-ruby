module Nuvemshop
  module Inflections
    def self.pascal_case(key)
      key.split('_').map(&:capitalize).join
    end
  end
end
