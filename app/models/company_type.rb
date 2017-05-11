#Perfil de Empresa
class CompanyType
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
end
