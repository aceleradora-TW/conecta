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
    erb :results
  end

  get "/search_companies" do
    # @result = []
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
      @companies = Institution.all(:name.like => "%#{@value}%")

    end
    erb :teste




    # @result = Company.all(:size.like => '%Grande%')
    # @result = Segment.all(:name.like => '%Software%')
    # @result.push(Institution.all(name: @value))

    # @result = Company.all(size: @value)
    # @result = Institution.all(name: @value)
  end

  # get "/search_companies2" do
  #   @value = params[:value]
  #   # @result2 = Company.all(size: @value)
  #   @result2 = Institution.all(name: @value)
  #   erb :teste
  # end
end
