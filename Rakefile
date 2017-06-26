require ::File.expand_path('../config/environment', __FILE__)
require_relative 'csv/csv_import.rb'
require_relative 'config/seed.rb'

desc 'Start Development Server Locally'

task :s do
  fork do
    exec "compass watch"
  end
  exec "rerun --background 'rackup config.ru --port 9393 --host 0.0.0.0'"
end

task :test do
  Rake::Task["db:reset"].invoke
  Rake::Task["db:seed_test"].invoke
  Rake::Task["db:seed_test_users"].invoke
  exec "rspec --format d --color"
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
