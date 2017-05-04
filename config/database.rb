require 'dm-core'
require  'dm-migrations'

configure :development do
  puts "Dev antes Banco"
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
  puts "Dev Depois Banco"
end

configure :production do
    puts "Prod antes Banco"
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_GRAY_URL'])
    puts "Prod Depois Banco"
end

Dir[APP_ROOT.join('app','models', '*.rb')].each { |file| require file }
DataMapper.finalize
DataMapper.auto_migrate!
