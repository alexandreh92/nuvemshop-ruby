module Nuvemshop
  class BaseModel < Object
    include Extensions::MassAssignment

    # Intercepts attr_acessor call, and assign it value to a variable named @attributes
    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat vars
      super(*vars)
    end

    # Getter to expose @attributes to class object
    def self.attributes
      @attributes
    end

    # Getter to expose @attributes to class instance
    def attributes
      self.class.attributes
    end

    # Transforms Object attributes into hash
    def to_hash
      hash = {}
      attributes.each { |var| hash[var.to_sym] = send(var.to_sym) }
      hash
    end

    # Overwrite default Ruby pretty_print(q) method to act as ActiveRecord's output
    def pretty_print(pp)
      pp.object_address_group(self) do
        variables = self.class.attributes.map do |attribute|
          attribute.to_s.delete(':')
        end

        pp.seplist(variables, proc { pp.text ',' }) do |attr_name|
          pp.breakable ' '
          pp.group(1) do
            pp.text attr_name
            pp.text ':'
            pp.breakable
            value = send(attr_name.to_sym) || nil
            pp.pp value
          end
        end
      end
    end

    alias to_h to_hash
  end
end
