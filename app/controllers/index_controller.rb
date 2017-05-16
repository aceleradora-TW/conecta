require_relative 'controller.rb'
require "sinatra/base"

class IndexController < Controller

  get "/" do
    @error = []
    erb :index
  end

  get "/index_search" do
    @error = []
    erb :index_search
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
    # SE CRASHAR FOI AQ
    # @research_centers = ResearchCenter.all
    # erb :research_centers
    @research_centers = ResearchCenter.all
    erb :results_centers
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

  get "/search_companies" do
    @value = params[:value]
    @search_type = params[:search_type]

    if @search_type == 'competencia'
      @competences = Competence.all(:name.like => "%#{@value}%")
      @competences_id =   @competences.map{|c| c.id}
      @company_competence = CompetenceInstitution.all(conditions: ['competence_id in ?',@competences_id])
    elsif @search_type == 'segmento'
      @segments = Segment.all(:name.like => "%#{@value}%")
      @segments_id = @segments.map{|s| s.id}
      @company_segments = InstitutionSegment.all(conditions: ['segment_id in ?',@segments_id])
    elsif @search_type == 'empresa'
      @companies = Company.all(:name.like => "%#{@value}%")
    elsif @search_type == 'centro-pesquisa'
      @research_center = ResearchCenter.all(:name.like => "%#{@value}%")
    end
    erb :search_all
  end

  get "/components" do
    erb :components
  end

  get "/import-companies" do
    require_relative "../../config/importCompany.rb"
  end

end
