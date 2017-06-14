# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'simplecov'
SimpleCov.start

require 'coveralls'
Coveralls.wear!


require 'capybara/rspec'
require 'capybara/dsl'

require './app/controllers/index_controller'

module RSpecMixin
  include Rack::Test::Methods
  def app() App end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  require './config/environment.rb'
  require './config/database.rb'
  require './config/mailer.rb'
  config.order = 'random'
  config.include RSpecMixin
  config.include Capybara::DSL
end

Capybara.app = IndexController
