#Area das Empresas
class CompanyArea
  include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true
  has n, :companies, :through => Resource
  #belongs_to :company, :required => false
end
