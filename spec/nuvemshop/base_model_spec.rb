require 'spec_helper'

RSpec.describe Nuvemshop::BaseModel do
  let!(:image_class) { Nuvemshop::Product::Image }
  let!(:image_instance) { image_class.new }

  it 'assigns class attributes' do
    expect(image_class.attributes).to eq(%i[id product_id src position alt created_at updated_at])
  end

  it 'assigns instance attributes' do
    expect(image_instance.attributes).to eq(%i[id product_id src position alt created_at updated_at])
  end

  it 'prints pretty_printed output' do
    actual = +''
    PP.pp(image_instance, StringIO.new(actual))
    expected = <<~PRETTY
      #<Nuvemshop::Product::Image:0xXXXXXX
       id: nil,
       product_id: nil,
       src: nil,
       position: nil,
       alt: nil,
       created_at: nil,
       updated_at: nil>
    PRETTY

    expect(actual).to be_start_with(expected.split('XXXXXX').first)
    expect(actual).to be_end_with(expected.split('XXXXXX').last)
  end
end
