require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página principal" do

      it "Deve mostrar o logo" do
        visit "/"
        expect(page).to have_content 'Logo'
      end

      it "Deve mostrar o Ver empresas" do
        visit "/"
        expect(page).to have_content 'Ver empresas'
      end

      it "Deve mostrar o Ver centros de pesquisa" do
        visit "/"
        expect(page).to have_content 'Ver centros de pesquisa'
      end

      it "Deve exibir o botão de buscar" do
        visit "/"
        expect(page).to have_css("button", class: 'Button')
      end

    end
  end
end
# end
# end
