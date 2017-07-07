require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página principal" do

      before :each do
        visit "/"
      end

      it "Deve mostrar o logo" do
        expect(page).to have_content 'Conecta'
      end

      it "Deve exibir o botão do filtro de busca" do
        expect(page).to have_css("button", class: 'ButtonFilter')
      end

      it "Deve exibir o texto do copyright no footer" do
        expect(page).to have_content "© 2017 Conecta, Todos os direitos reservados."
      end

      it "Deve exibir o botão da lista de empresas" do
        expect(page).to have_selector('span', text: 'Empresas')
      end

      it "Deve exibir o botão da lista de estruturas de pesquisa" do
        expect(page).to have_selector('span', text: 'Estruturas de Pesquisa')
      end


      it "Deve exibir o botão login na navbar" do
        expect(page).to have_css('a', id: 'login')
      end
    end
  end
end
