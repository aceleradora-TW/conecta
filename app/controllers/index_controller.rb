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
    #metodo de pesquisa
    area_competence
    erb :results
  end

  get "/search_all" do
    @value = params[:value]
    @search_type = params[:search_type]

    if @search_type == 'competencia'
      @companies = Company.all
      area_competence
      @companies_searched = []
      @competences = Competence.all(:name.like => "%#{@value}%")
      @competences_id =   @competences.map{|c| c.id}
      @company_competence = CompetenceInstitution.all(conditions: ['competence_id in ? and (competence_value = 4 or competence_value = 5 or competence_value = 6)',@competences_id])
      @company_competence.each do |single_cmp_competence|
        local_company = single_cmp_competence.company
        if !@companies_searched.include? local_company
          @companies_searched.push(local_company)
        end
      end


    elsif @search_type == 'segmento'
      @segments = Segment.all(:name.like => "%#{@value}%")
      @segments_id = @segments.map{|s| s.id}
      @company_segments = InstitutionSegment.all(conditions: ['segment_id in ?',@segments_id])


    elsif @search_type == 'empresa'
      @companies = Company.all(:name.like => "%#{@value}%")
      #metodo de pesquisa

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


  def area_competence
    @competences_by_company = {}
    @companies.each do |company|
      filtered_competences = {}
      company.competence_institutions.each do |comp_all|
        if filtered_competences.key?(comp_all.competence.competence_area.name)
          competence_area_array = filtered_competences[comp_all.competence.competence_area.name]
          competence_area_array.push(comp_all.competence.name + " | " + comp_all.competence_value + " | ")
        else
          competence_area_array = [comp_all.competence.name + " | " + comp_all.competence_value + " | "]
          filtered_competences[comp_all.competence.competence_area.name] = competence_area_array
        end
        @competences_by_company[company] = filtered_competences
      end
    end
  end

end
