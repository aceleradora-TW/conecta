
require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe IndexController do
  describe "Resultados Buscados" do
    context "Quando abrir página de resultado da busca" do

      it "Deve mostrar a lista de busca" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_content('Resultados Buscados')
      end

      it "Deve mostrar o botão de empresas" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_link('Empresas')
      end

      it "Deve mostrar o botão de Estruturas de pesquisa" do
        visit "/search_all?search_type=centro-pesquisa&value="
        expect(page).to have_link('Estruturas de pesquisa')
      end

      it "Deve mostrar a lista de empresas" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_link('Empresas')
      end

      it "Deve mostrar a lista de Estruturas de pesquisa" do
        visit "/search_all?search_type=centro-pesquisa&value="
        expect(page).to have_link('Estruturas de pesquisa')
      end

    end
  end
end
