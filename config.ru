require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../config/database',  __FILE__)
require ::File.expand_path('../config/mailer',  __FILE__)
require 'omniauth'

set :app_file, __FILE__

use Rack::Static, :urls => ["/images", "/js", "/stylesheets/css"], :root => "public"
use Rack::Session::Cookie
use OmniAuth::Strategies::Developer

# run Sinatra::Application

map '/' do
  run IndexController
end
