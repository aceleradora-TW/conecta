require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página principal" do

      it "Deve mostrar o logo" do
        visit "/"
        expect(page).to have_content 'Conecta'
      end

      it "Deve mostrar o Ver empresas" do
        visit "/"
        expect(page).to have_content 'Ver empresas'
      end

      it "Deve mostrar o Ver estruturas de pesquisa" do
        visit "/"
        expect(page).to have_content 'Ver estruturas de pesquisa'
      end

      it "Deve exibir o botão de buscar" do
        visit "/"
        expect(page).to have_css("button", class: 'Button')
      end

      it "Deve conter o link de redirecionamento para lista de empresas" do
        visit "/"
        expect(page).to have_link("Listar", :href=>"/results")
      end

      it "Deve conter o link de redirecionamento para lista de estruturas de pesquisas" do
        visit "/"
        expect(page).to have_link("Listar", :href=>"/research_centers")
      end

    end
  end
end
# end
# end
