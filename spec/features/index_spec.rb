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
        expect(page).to have_css("button", class: 'btn-filter')
      end

      it "Deve exibir o texto do copyright no footer" do
        visit "/"
        expect(page).to have_content "© 2017 Conecta, Todos os direitos deservados."
      end

    end
  end
end
# end
# end
