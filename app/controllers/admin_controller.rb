require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/session_service"

use Rack::Session::Cookie, :key => 'rack.session',
:expire_after => 2592000,
:secret => ENV['SESSION_SECRET']

class AdminController < Controller
  def initialize father_controller
    super father_controller
    @session_service = SessionService.new
  end

  get "/admin" do
    user_id = session[:id]
    if user_id
      user = User.first(id: user_id)
      @admin = user.is_admin
    else
      @admin = "Não logado"
    end
    erb :login
  end

  post "/session" do
    user = @session_service.find_user_by(email: params[:email], password: params[:password])
    if(user)
      session[:id] = user.id
      session[:name] = user.name
      session[:email] = user.email
      session[:role] = user.role
      return "Logado com sucesso"
    else
      return  "[erro]Usuário ou senha incorreta"
    end
  end

  get "/session/logout" do
    session.clear
    redirect "/admin"
  end
end
