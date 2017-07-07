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

      it "Deve exibir o campo de busca" do
        expect(page).to have_css('input', class: 'InputSearch')
      end

      it "Deve exibir o texto do copyright no footer" do
        expect(page).to have_content "© 2017 Conecta, Todos os direitos reservados."
      end

      it "Deve exibir o título Como Funciona" do
        expect(page).to have_selector('h1', text: 'Como Funciona')
      end

      it "Deve exibir o título Sobre" do
        expect(page).to have_selector('h1', text: 'Sobre')
      end
      it "Deve exibir o título Colaboradores" do
        expect(page).to have_selector('h1', text: 'Colaboradores')
      end

      it "Deve exibir o botão login na navbar" do
        expect(page).to have_css('a', id: 'login')
      end

    end
  end
end
