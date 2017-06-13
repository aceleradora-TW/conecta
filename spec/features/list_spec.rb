require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "List" do
    context "Quando abrir a listagem" do

      it "Deve mostrar eldorado" do
        visit "/list_all"
        expect(page).to have_content 'Eldorado'
      end

      it "Deve mostrar HPServ" do
        visit "/list_all"
        expect(page).to have_content 'HPServ'
      end

      it "Deve mostrar Laboratório de Tratamento de imagens e Geoprocessamento" do
        visit "/list_all"
        expect(page).to have_content 'Laboratório de Tratamento de imagens e Geoprocessamento'
      end

      it "Deve mostrar Laboratório de Sistema Wireless" do
        visit "/list_all"
        expect(page).to have_content 'Laboratório de Sistema Wireless'
      end

    end
  end
end
