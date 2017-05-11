#Competencias de Empresas
class Competence
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, :required => true
  has n, :companies, :through => Resource
end
