require 'sinatra/base'

class Config < Sinatra::Base
  set :views, File.join(root, "..", "views")
end
