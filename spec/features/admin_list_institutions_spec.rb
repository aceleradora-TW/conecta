require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do

  describe "Listar Instituição na Área  Admin" do

    context "Quando abrir a listagem" do
      def login_admin
        visit "/admin"
        page.find_by_id('email').set('admin@admin.com')
        page.find_by_id('password').set('admin')
        page.find_by_id('LoginButton').click
        visit "/admin/list_institutions"
        puts page.html
      end

      before :each do
        login_admin
      end

      skip "Deve mostrar eldorado" do
        expect(page).to have_content 'Eldorado'
      end

      skip "Deve mostrar HPServ" do
        expect(page).to have_content 'HPServ'
      end

      skip "Deve mostrar Centro de Pesquisas em Biologia Molecular e Funcional" do
        expect(page).to have_content 'Centro de Pesquisas em Biologia Molecular e Funcional'
      end

      skip "Deve mostrar Centro de Terapia Celular" do
        expect(page).to have_content 'Centro de Terapia Celular'
      end

      skip "Deve mostrar Botao de cadastro de empresa" do
        expect(page).to have_css("div", class: 'RegisterTitle')
      end

      skip "Deve mostrar Botao de cadastro de estrutura de pesquisa" do
        expect(page).to have_css("div", class: 'RegisterTitle')
      end

    end
  end
end
