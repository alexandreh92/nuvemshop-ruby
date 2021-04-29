# NuvemshopRuby

This is a Wrapper for Nuvemshop/Tiendanube API. his gem is a work in progress. If you like to contribute, please get in touch!

## Working Features

- `Nuvemshop::Orders.all`
- `Nuvemshop::Orders.show`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nuvemshop'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nuvemshop

## Usage

If you use rails you can add this code below in `config/initializers/nuvemshop.rb`
```
require 'nuvemshop'

Nuvemshop.configure do |config|
  config.client_id = 'your_client_id'
  config.client_secret = 'your_client_secret'
  config.user_agent = 'Your Company/Name (your_email@domain.com)'
  config.store_access_token = 'your_store_access_token'
  config.store_user_id = 'your_user_id'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nuvemshop-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nuvemshop_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NuvemshopRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nuvemshop_ruby/blob/master/CODE_OF_CONDUCT.md).
