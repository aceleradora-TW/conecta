require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe Mailer, type: :mailer do

  before(:all) do
    @contact_mail = Mailer.send_email_contact()
  end
  describe "#send_email_contact" do
    context "Quando chamar o metodo" do

      it "Deve enviar um e-mail para aceleradora11@gmail.com" do
        expect(@contact_mail.to).to eq(['aceleradora11@gmail.com'])
      end

    end
  end
end
