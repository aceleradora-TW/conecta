require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando listar todas as empresas" do
      it "deve mostrar na tela Lista de Instituições" do
        visit "/"
        puts page.body
        expect(page).to have_content 'pessoal'
      end
    end
  end
end
# end
