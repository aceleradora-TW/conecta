get "/" do
  @company =  Company.create(name: "Teste1")
  erb :index
end
