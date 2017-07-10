
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
  config.include RSpecMixin
  config.include Capybara::DSL
end
Capybara.app = Rack::Builder.parse_file(File.expand_path('../../config.ru', __FILE__)).first
