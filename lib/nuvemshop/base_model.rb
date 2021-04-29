module Nuvemshop
  class BaseModel < Object
    include Extensions::MassAssignment

    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat vars
      super(*vars)
    end

    def self.attributes
      @attributes
    end

    def attributes
      self.class.attributes
    end

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
  end
end
