require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página principal" do
      it "Deve mostrar boas vindas" do
        visit "/"
        expect(page).to have_content 'Olá pessoal'
      end
    end

    context "Quando abrir página principal" do
      it "Deve exibir o campo de busca" do
        visit "/"
        expect(page).to have_css("input", class: 'search-field')
      end
    end
  end
end
# end
