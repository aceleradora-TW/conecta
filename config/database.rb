require 'dm-core'
require  'dm-migrations'
require 'dm-validations'
DataMapper::Property::String.length(255)

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_GRAY_URL'])
end

Dir[APP_ROOT.join('app','models', '*.rb')].each { |file| require file }
DataMapper.finalize
