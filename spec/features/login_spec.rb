require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página de login" do
      it "Deve mostrar o titulo Login" do
        visit "/admin"
        expect(page).to have_content 'Login'
      end

      it "Deve exibir os campos de texto do Login" do
        visit "/admin"
        expect(page).to have_css("input", class: 'InputLogin')
      end

      it "Deve exibir o botão de Login" do
        visit "/admin"
        expect(page).to have_css("button", class: 'ButtonSend')
      end

      it "Deve mostrar link 'esqueceu sua senha?'" do
        visit "/admin"
        expect(page).to have_link('Esqueceu sua senha?')
      end
    end
  end
end
