require 'data_mapper'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

DataMapper::Property::String.length(255)

configure :development do
  DataMapper.setup(:default, "postgres://test:test@db/test_db")
end

configure :test do
  DataMapper.setup(:default, "postgres://test:test@db_test/test_db")
end

configure :production do
  DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_GRAY_URL'])
end

:install_unaccent_module

Dir[APP_ROOT.join('app','models', '*.rb')].each { |file| require file }
DataMapper.finalize


def install_unaccent_module
  adapter = DataMapper.repository(:default).adapter
  adapter.execute("create extension unaccent")
end
