require 'rack/test'
require 'rspec'
require 'spec_helper'

RSpec.describe IndexController do
  describe "Index" do
    context "Quando importar dados do CSV" do

      before :each do
        
      end

      it "Deve mostrar o logo" do
        expect(page).to have_content 'Conecta'
      end
    end
  end
end
