require 'sinatra/base'

class Config < Sinatra::Base
  set :views, File.join(Sinatra::Application.root, "app", "views")
end
