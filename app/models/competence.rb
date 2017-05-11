#Competencias de Empresas
class Competence
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  has 1, :companyArea , :required => false
  
  belongs_to :company, :required => false
  belongs_to :companyArea, :required => false
end
