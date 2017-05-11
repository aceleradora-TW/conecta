source 'https://rubygems.org'

gem 'sinatra'
gem 'shotgun'
gem 'data_mapper'

gem 'puma'
gem 'tux'
gem "rack"

group :development, :test do
  gem 'rspec', '~> 2.14'
  gem "rack-test"
  gem 'sqlite3'
  gem 'capybara'
  gem 'dm-sqlite-adapter'
end

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end
