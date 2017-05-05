get "/" do

@company = Company.create(name: 'tw', description: 'uma descricao qlqr', size: 'GRANDE')


  erb :index
end
