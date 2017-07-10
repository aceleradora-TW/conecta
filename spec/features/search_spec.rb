require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe IndexController do
  describe "Resultados Buscados" do
    context "Quando abrir página de resultado da busca" do

      it "Deve mostrar a lista de busca" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_content('Exibindo')
      end

      it "Deve mostrar o sobre nós na barra de navegação do resultado da busca por empresas" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_content('Sobre nós')
      end

      it "Deve mostrar o botão contato" do
        visit "/search_all?search_type=empresa&value="
        expect(page).to have_content('contato')
      end

      it "Deve mostrar uma modal ao clicar no botão contato" do
        visit "/search_all?search_type=empresa&value="
        find("#ButtonContact1").click
        expect(page).to have_css(".ModalContent")
      end
    end
  end
end
