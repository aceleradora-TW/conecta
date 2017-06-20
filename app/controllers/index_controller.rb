# -*- encoding : utf-8 -*-
require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/search_service"
require_relative "../services/router_service"

class IndexController < Controller
  def initialize
    super
    @router_service = RouterService.new
  end

  get "/" do
    @error = []
    erb :index
  end

  get "/search_all" do
    @value = params[:value]
    @search_type = params[:search_type]
    @search_description = "Exibindo #{@search_type}s para '#{@value}'"

    if @search_type
      @value = @value ? @value : ""
      value_sql = "%#{@value.strip.downcase}%"
      @institution = @router_service.return_found_values value_sql, @search_type
      erb :search_all
    end
  end

  post "/request_contact" do
    @name = params[:name]
    @email = params[:email]
    @comment = params[:comment]
    @institution_id = params[:institution_id]
    @institution = Institution.get(@institution_id)
    if(!@institution.contact)
      # Comentário Temporário! Contato ficticio para validação com PO.
      # return "[erro]A instituição #{@institution.name} não possui email cadastrado."
      @institution.contact = Contact.new(email: "aceleradora11@gmail.com", contact_name: "Fulano da Empresa")
    end
    institution_contact_name = @institution.contact.contact_name
    institution_email = @institution.contact.email
    "Email: #{institution_email}"
    email_infos = EmailData.new(@name, @email, @comment, institution_contact_name, institution_email)
    mailer = ContactMailer.new email_infos

    mailer.send_now
    "Email Enviado com Sucesso!"

  end
end
