require ::File.expand_path('../config/environment', __FILE__)

desc 'Start Development Server Locally'
task "s" do
  fork do
    # sass watch
    exec "compass watch"
  end
  exec "rerun --background 'rackup config.ru --port 9393 --host 0.0.0.0'"
end
task "i" do
  exec "ruby csv/csv_import.rb"
end
task "test" do
  exec "rspec -fd -c"
end
