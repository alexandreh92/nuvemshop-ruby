require 'simplecov'

SimpleCov.start do
  add_group 'Nuvemshop', 'lib/nuvemshop'
  add_group 'Order', 'lib/nuvemshop/order'
  add_filter '/spec/'
end
