require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe Mailer, type: :mailer do

  before(:all) do
    @mail = Mailer.notification()

  end
  describe "#notification" do
    context "Quando chamar o metodo" do

      it "Deve enviar um e-mail para cvcardozo@me.com" do
        expect(@mail.to).to eq(['xxx@xxx.com'])
      end

    end
  end
end
