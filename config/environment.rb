require 'bundler/setup'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :public_folder, File.join(APP_ROOT, "public")
  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'rubyrubyruby'

  # Move to app/controllers/config.rb
  # set :views, File.join(Sinatra::Application.root, "app", "views")
end
puts "AOO ROOT :" + APP_ROOT.to_path
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
