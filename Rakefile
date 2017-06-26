require ::File.expand_path('../config/environment', __FILE__)
require ::File.expand_path('../config/database', __FILE__)
require_relative 'csv/csv_import.rb'
require_relative 'config/seed.rb'

task :s do
  desc 'Start Development Server Locally'
  fork do
    exec "compass watch"
  end
  exec "rerun --background 'rackup config.ru --port 9393 --host 0.0.0.0'"
end

task :test do
  Rake::Task["db:reset"].invoke
  Rake::Task["db:seed_test"].invoke
  Rake::Task["db:seed_test_users"].invoke
  exec "rspec --format d"

end

namespace :db do

  task :migrate do
    DataMapper.auto_upgrade!
  end

  task :reset do
    DataMapper.auto_migrate!
  end

  task :seed do
    CsvImport.run
  end

  task :seed_test do
    Seed.seed
  end

  task :seed_test_users do
    Seed.seed_users
  end

end
