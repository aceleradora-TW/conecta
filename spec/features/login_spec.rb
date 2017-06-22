require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando abrir página de login" do
      skip "Deve mostrar o titulo Login" do
        visit "/admin"
        expect(page).to have_content 'Login'
      end

      skip "Deve exibir os campos de texto do Login" do
        visit "/admin"
        skip expect(page).to have_css("input", class: 'InputLogin')
      end

      skip "Deve exibir o botão de Login" do
        visit "/admin"
        expect(page).to have_css("button", class: 'ButtonSend')
      end

      skip "Deve mostrar link 'esqueceu sua senha?'" do
        visit "/admin"
        expect(page).to have_link('Esqueceu sua senha?')
      end
    end
  end
end
