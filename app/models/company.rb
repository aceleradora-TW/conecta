require_relative 'institution'
#Empresas
class Company < Institution
  property :size, String
  has n, :segments, :through => Resource
  has n, :companyTypes
  has n, :companyAreas
end
