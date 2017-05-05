get "/" do

@company = Company.create(name: 'tw', description: 'umadescricaoqlqr', size: 'GRANDE')


  erb :index
end
