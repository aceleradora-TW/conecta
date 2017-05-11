require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página principal" do
      it "Deve mostrar boas vindas" do
        visit "/"
        puts page.body
        expect(page).to have_content 'Olá pessoal'
      end
    end
  end
end
# end
