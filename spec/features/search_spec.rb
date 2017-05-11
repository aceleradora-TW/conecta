require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Search" do
    context "Quando abrir página de resultado da busca" do
      it "Deve mostrar a lista de busca" do
        visit "/search"
        expect(page).to have_content 'Lista de Empresas'
        expect(page).to have_css('div', class: 'instituionName')
        expect(page).to have_css('div', class: 'instituionArea')
      end
    end
  end
end
