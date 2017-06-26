require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/session_service"

use Rack::Session::Cookie, :key => 'rack.session',
:expire_after => 2592000,
:secret => ENV['SESSION_SECRET']

DEFAULT_ADMIN_ROUTE = "/admin/list_instituitions"
DEFAULT_USER_ROUTE = "/admin/company"

class AdminController < Controller
  def initialize father_controller
    super father_controller
    @session_service = SessionService.new
  end
  before '/admin*' do
    @user_info = @session_service.get_user_session_info(session)
  end

  get "/admin" do
    if @user_info.is_logged_in
      if @user_info.is_admin
        redirect DEFAULT_ADMIN_ROUTE
      else
        redirect DEFAULT_USER_ROUTE
      end
    end
    erb :login, :layout => :layout_admin
  end

  get "/admin/list_instituitions" do
    if @user_info.is_admin
      @companies = Company.all(order: [:name.asc])
      @research_centers = ResearchCenter.all(order: [:name.asc])
      erb :list_institutions, :layout => :layout_admin
    else
      erb :forbidden, :layout => :layout_admin
    end
  end

  get "/admin/company" do
    if @user_info.is_logged_in
      erb :institution, :layout => :layout_admin
    else
      erb :forbidden, :layout => :layout_admin
    end
  end

  get "/admin/register" do
    if @user_info.is_logged_in and @user_info.is_admin
      erb :register, :layout => :layout_admin
    else
      erb :forbidden, :layout => :layout_admin
    end
  end

  get "/admin/register/2" do
    if @user_info.is_logged_in and @user_info.is_admin
      erb :register2, :layout => :layout_admin
    else
      erb :forbidden, :layout => :layout_admin
    end
  end

  get "/admin/register/3" do
    if @user_info.is_logged_in and @user_info.is_admin
      erb :register3, :layout => :layout_admin
    else
      erb :forbidden, :layout => :layout_admin
    end
  end

  post "/session" do
    user = @session_service.find_user_by(email: params[:email], password: params[:password])
    if(user)
      @session_service.set_user_session session, user
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
