class App < Config

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

  get "/import-companies" do
    require_relative "../../config/importCompany.rb"
  end

end
