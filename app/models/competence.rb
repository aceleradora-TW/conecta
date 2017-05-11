#Competencias de Empresas
class Competence
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, :required => true
  #has 1, :company_area , :required => false
  has n, :companies, :through => Resource
end
