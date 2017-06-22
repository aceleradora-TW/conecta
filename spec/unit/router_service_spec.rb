require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe RouterService do

  before(:all) do
    @router_service = RouterService.new

    # @dell = Company.new(size: "")
  end

  describe '#return_company' do
    it 'Deve retornar empresa Dell' do
      search_service = SearchService.new
      resultado = @router_service.return_company "Dell", search_service

      expect(resultado.length).to eq(1)
    end
  end
end
