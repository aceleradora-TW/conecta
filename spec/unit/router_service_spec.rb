require 'rspec'
require_relative '../../app/services/router_service'

describe RouterService do
  it "Retorna competencias procuradas" do
    mock_find_by = spy(mock_find_by)
    router_service = RouterService.new(mock_find_by)

    router_service.return_competence("software","empresa")

    expect(mock_find_by).to have_received(:find_by_competence).with("software")

  end
end




































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
