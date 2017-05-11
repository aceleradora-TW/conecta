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

it "Deve exibir o campo de busca" do
  visit "/"
  expect(page).to have_css("input", class: 'search-field')
end

it "Deve exibir o botão de busca" do
  visit "/"
  expect(page).to have_css("button", class: 'button-primery')
end
end
end
end
# end
# end
