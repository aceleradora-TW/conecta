get "/" do
  @error = []

  ### Exemplo de como Utiliza o Banco de dados
  # @company = Company.new(name: 'tw', description: 'uma descricao qlqr', size: 'GRANDE')
  # @location = Location.new(city: "Porto Alegre", number: "123", state: "RS", street: "Av Ipiranga")
  # if !@company.save
  #   @company.errors.each do |error|
  #     @error.push(error)
  #   end
  # end
  # if !@location.save
  #   @location.errors.each do |error|
  #        @error.push(error)
  #   end
  # end
  #
  # @location.institution = @company
  # @location.save
  # @locationSozinha = @company.locations
  erb :index
end
