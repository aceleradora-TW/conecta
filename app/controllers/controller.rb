require 'sinatra/base'

class Controller < Sinatra::Base
  set :views, File.join(root, "..", "views")
end
