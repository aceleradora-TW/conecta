require_relative 'controller.rb'
require "sinatra/base"

class IndexController < Controller

  get "/" do
    @error = []
    erb :index
  end

  get "/companies" do
    @companies = Company.all
    erb :companies
  end

  get "/segments" do
    @segments = Segment.all
    erb :segments
  end

  get "/competences" do
    @competences = Competence.all
    erb :competences
  end

  get "/search" do
    erb :search
  end

  get "/results" do
    @companies = Company.all
    erb :results
  end

  get "/import-companies" do
    require_relative "../../config/importCompany.rb"
  end

end
