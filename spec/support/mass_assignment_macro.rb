module MassAssignmentMacro
  def it_assigns_attribute(attr, value = nil)
    it "assigns #{attr} on initialize" do
      object = described_class.new(attr => value)
      expect(object.public_send(attr)).to eql(value)
    end
  end
end

RSpec.configure { |c| c.extend(MassAssignmentMacro) }
