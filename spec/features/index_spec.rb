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

      it "Deve exibir o botão do filtro de busca" do
        visit "/"
        expect(page).to have_css("button", class: 'ButtonFilter')
      end

      it "Deve exibir o texto do copyright no footer" do
        visit "/"
        expect(page).to have_content "© 2017 Conecta, Todos os direitos deservados."
      end

      it "Deve exibir o botão da lista de empresas" do
        visit "/"
        expect(page).to have_selector('span', text: 'Empresas')
      end

      it "Deve exibir o botão da lista de estruturas de pesquisa" do
        visit "/"
        expect(page).to have_selector('span', text: 'Estruturas de Pesquisa')
      end

      it "Deve exibir o título Como Funciona" do
        visit "/"
        expect(page).to have_selector('h1', text: 'Como Funciona')
      end

      it "Deve exibir o título Sobre" do
        visit "/"
        expect(page).to have_selector('h1', text: 'Sobre')
      end
      it "Deve exibir o título Colaboradores" do
        visit "/"
        expect(page).to have_selector('h1', text: 'Colaboradores')
      end

    end
  end
end
