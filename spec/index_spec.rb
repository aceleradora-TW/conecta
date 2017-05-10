require './app/controllers/index_controller'
require 'rack/test'
require 'spec_helper'

RSpec.describe App do
  include Rack::Test::Methods

  def app
    App.new
  end

  describe "OLA" do
    context "Quando listar todas as empresas" do
      it "deve mostrar na tela" do

        get "/"
        expect(1).to eq (1)

      end
    end
  end
end
