require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando listar centros de pesquisa" do
      before :each do
        visit "/search_all?search_type=centro-pesquisa"
      end

      it "Deve exibir o nome da competência" do
        expect(page).to have_content 'Toxicologia'
      end

      it "Deve exibir estrelinhas" do
        expect(page).to have_css("i", class: 'u-colorGold')
      end

      it "Deve exibir certinhos" do
        expect(page).to have_css("i", class: 'u-colorGreen')
      end
    end
  end

  context "Quando listar empresas" do
    before :each do
      visit "/search_all?search_type=empresa"
    end

    it "Deve exibir o nome da competência" do
      expect(page).to have_content 'Desenvolvimento Mobile'
    end

    it "Deve exibir estrelinhas" do
      expect(page).to have_css("i", class: 'u-colorGold')
    end

    it "Deve exibir certinhos" do
      expect(page).to have_css("i", class: 'u-colorGreen')
    end
  end
end
