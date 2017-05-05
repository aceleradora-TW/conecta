get "/" do
  @institution = Institution.create(name: 'outra Inst', description: 'descricao qlqr')

  @allInstitutions = Institution.all

  @contact = Contact.create(site: 'testesite')
  @institution.contact = @contact
  @institution.save



  erb :index
end
