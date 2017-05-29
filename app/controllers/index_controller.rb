require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/search_service"
require_relative "search_controller"

class IndexController < Controller

  get "/" do
    @error = []
    erb :index
  end

  get "/index_search" do
    @error = []
    erb :index_search
  end

  get "/segments" do
    @segments = Segment.all
    erb :segments
  end

  get "/competences" do
    @competences = Competence.all
    erb :competences
  end

  get "/research_centers" do

    @research_centers = ResearchCenter.all
    erb :results_centers
  end

  get "/results" do
    @companies = Company.all
    area_competence
    erb :results
  end

  get "/search_all" do
    search_controller = SearchController.new
    @value = params[:value]
    @search_type = params[:search_type]
    @value_sql = "%#{@value.downcase}%"
    @institution = search_controller.return_found_values @value_sql, @search_type

    erb :search_all
  end

  get "/components" do
    erb :components
  end

  get "/import-companies" do
    require_relative "../../config/importCompany.rb"
  end


end
