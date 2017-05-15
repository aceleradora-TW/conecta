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

  get "/research_centers" do
    @research_centers = ResearchCenter.all
    erb :research_centers
  end

  get "/results" do
    @companies = Company.all
    @competences_by_company = {}
    @companies.each do |company|
      filtered_competences = {}
      company.competences.each do |competence|
        if !(filtered_competences.key?(competence.competence_area.name))
          competence_area_array = [competence.name]
          filtered_competences[competence.competence_area.name] = competence_area_array
        else
          competence_area_array = filtered_competences[competence.competence_area.name]
          competence_area_array.push(competence.name)
        end
        @competences_by_company[company] = filtered_competences
      end
    end
    erb :results
  end
end
