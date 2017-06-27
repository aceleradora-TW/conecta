require 'rspec'
require_relative '../../app/services/router_service'

describe RouterService do
  it "Chama o serviço que retorna competencias" do
    mock_search_service = spy("mock_search_service")
    router_service = RouterService.new(mock_search_service)

    router_service.return_competence("software","empresa")

    expect(mock_search_service).to have_received(:find_by_competence).with("software")

  end

  it "Não retorna instituição quando competencia não é especificada" do
    mock_search_service = double("mock_search_service")
    allow(mock_search_service).to receive(:find_by_competence).and_return([])
    router_service = RouterService.new(mock_search_service)

    result = router_service.return_competence("dummy", "dummy")

    expect(result).to eq([])
  end
end





# it "Chama o serviço que retorna Empresas relacionadas às competências" do
#
#
# end
































# require 'rack/test'
# require 'rspec'
# require 'spec_helper'
#
# RSpec.describe RouterService do
#
# #   before(:all) do
# #     @router_service = RouterService.new
# #
# #     # @dell = Company.new(size: "")
# #   end
# #
# #   describe '#return_company' do
# #     it 'Deve retornar empresa Dell' do
# #       search_service = SearchService.new
# #       resultado = @router_service.return_company "Dell", search_service
# #
# #       expect(resultado.length).to eq(1)
# #     end
# #   end
# # end
