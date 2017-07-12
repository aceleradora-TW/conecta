require 'rack/test'
require 'rspec'
require 'spec_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 3
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,{js_errors: false})
end

RSpec.describe IndexController do
  describe "Listar Instituição na Área  Admin" do
    context "Quando abrir a listagem", js: true do
      def login_admin
        page.visit "/admin"
        page.find_by_id('email').set('admin@admin.com')
        page.find_by_id('password').set('admin')
        page.click_button 'Entrar'
        wait_for_ajax

        page.visit "/admin/list_institutions"
      end

      def wait_for_ajax
        Timeout.timeout(Capybara.default_max_wait_time) do
          active = page.evaluate_script('jQuery.active')
          until active == 0
            active = page.evaluate_script('jQuery.active')
          end
        end
      end

      before(:each) do
        login_admin
      end

      it "Deve mostrar Empresas e Estruturas de Pesquisa" do
        expect(page).to have_content 'Eldorado'
        expect(page).to have_content 'HPServ'
        expect(page).to have_content 'Centro de Pesquisas em Biologia Molecular e Funcional'
        expect(page).to have_content 'Centro de Terapia Celular'
        expect(page).to have_css("div", class: 'RegisterTitle')
        expect(page).to have_css("div", class: 'RegisterTitle')
      end
    end
  end
end
