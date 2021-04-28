require 'extensions/simplecov'
require 'bundler/setup'
require 'nuvemshop'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after do
    Nuvemshop.configure do |cfg|
      cfg.client_id = nil
      cfg.client_secret = nil
      cfg.user_agent = nil
      cfg.store_access_token = nil
      cfg.store_user_id = nil
    end
  end
end
