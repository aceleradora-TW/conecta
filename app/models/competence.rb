#Competencias de Empresas
class Competence
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, :required => true
  belongs_to :competence_area
  has n, :companies, :through => Resource
end
