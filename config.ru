require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../config/database',  __FILE__)
require ::File.expand_path('../config/mailer',  __FILE__)

set :app_file, __FILE__

map '/' do
  run IndexController
end
