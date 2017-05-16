require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../config/database',  __FILE__)
set :app_file, __FILE__

use Rack::Static, :urls => ["/images", "/js", "/stylesheets/css"], :root => "public"
# run Sinatra::Application

map '/' do
  run IndexController
end
