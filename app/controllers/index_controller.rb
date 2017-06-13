# -*- encoding : utf-8 -*-
require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/search_service"
require_relative "../services/router_service"

class IndexController < Controller

  def initialize
    super
    @router_service = RouterService.new
  end

  get "/" do
    @error = []
    erb :index
  end

  get "/search_all" do
    @value = params[:value]
    @search_type = params[:search_type]
    if @search_type
      @value = @value ? @value : ""
      value_sql = "%#{@value.strip.downcase}%"
      @institution = @router_service.return_found_values value_sql, @search_type
      erb :search_all
    end
  end

  get "/list_all" do
    @institution = Institution.all
    erb :list_all
  end


end
