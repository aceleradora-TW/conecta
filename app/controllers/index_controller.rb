# -*- encoding : utf-8 -*-
require_relative 'controller.rb'
require "sinatra/base"
require_relative "../services/search_service"
require_relative "../services/router_service"
require_relative "./admin_controller"
# só um comentario pra ter a branch no git hub
class IndexController < Controller
  use AdminController

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
    case @search_type
    when 'centro-pesquisa' then
      search_type = "Centros de pesquisa"
    when 'estrutura-pesquisa-competencia' then
      search_type = "Competências das estruturas de pesquisa"
    when 'competencia' then
      search_type = "Competências das empresas"
    when 'segmento' then
      search_type = "Segmentos das empresas"
    when 'empresa' then
      search_type = "Empresas"
    when 'estrutura-pesquisa-segmento' then
      search_type = "Segmentos das estruturas de pesquisa"
    end
    if @value != ""
      @search_description = "Exibindo #{search_type} para '#{@value}'"
    else
      @search_description = "Exibindo #{search_type}"
    end

    if @search_type
      @value = @value ? @value : ""
      value_sql = "%#{@value.strip.downcase}%"
      value_sql = value_sql.gsub(/\s+/m, '%')

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
    begin
      mailer = ContactMailer.new email_infos
      mailer.send_now
      "Email Enviado com Sucesso!"
    rescue
      "[erro] Variáveis de ambiente GMAIL_USER ou GMAIL_PASSWORD não configuradas."
    end
  end

  get "/about_us" do
    @is_about_us = request.path_info == '/about_us'
    erb :about_us
  end
end
