require 'rack/test'
require 'rspec'
require 'spec_helper'


RSpec.describe Mailer, type: :mailer do
  before(:all) do
    #@configs = {from: {name: "User1", email: , comment: },to:{ name: , email: },subject: "Test Mail"}
    @email_info = EmailData.new("User1", "aceleradora11@gmail.com", "Olá Galera!", "Equipe Aceleradora", "aceleradora11@gmail.com","Test Mail")
    @contact_mailer = ContactMailer.new @email_info
  end
  describe "#send_email_contact" do
    context "Quando chamar o metodo" do
      it "Deve enviar um e-mail para Aceleradora11" do
        expect(@contact_mailer.email.to).to eq(["aceleradora11@gmail.com"])
      end
    end
  end
end
