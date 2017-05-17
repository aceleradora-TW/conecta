#Competencias de Empresas
class Competence
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, :required => true


  has n, :companies, :through => :competence_institutions
  has n, :competence_institutions
  belongs_to :competence_area
end
