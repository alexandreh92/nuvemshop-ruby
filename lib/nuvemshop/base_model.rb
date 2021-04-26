module Nuvemshop
  class BaseModel
    include Extensions::MassAssignment

    def pretty_print(pp)
      pp.object_address_group(self) do
        variables = instance_variables.map do |attribute|
          attribute.to_s.delete('@')
        end

        pp.seplist(variables, proc { pp.text ',' }) do |attr_name|
          pp.breakable ' '
          pp.group(1) do
            pp.text attr_name
            pp.text ':'
            pp.breakable
            value = send(attr_name.to_sym)
            pp.pp value
          end
        end
      end
    end
  end
end
