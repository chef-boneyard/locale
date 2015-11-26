require 'chefspec'

RSpec.configure do |config|
  # Specify the operating platform to mock Ohai data from
  config.platform = 'centos'

  # Specify the operating version to mock Ohai data from
  config.version = '6.7'

  # Use color output for RSpec
  config.color = true
  config.tty = true

  # Use documentation output formatter
  config.formatter = :documentation
end

at_exit { ChefSpec::Coverage.report! }
