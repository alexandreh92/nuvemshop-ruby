module Nuvemshop
  module Inflections
    def self.infer_key_class_name(klass, key)
      Object.const_get(klass.to_s.split('::')[0..-2].push(pascal_case(key)).join('::'))
    rescue NameError
      Nuvemshop::GenericModel
    end
  end
end
