require_relative 'institution'
#Empresas
class Company < Institution
  property :size, String
  has n, :segments, :through => Resource
  has n, :company_types, :through => Resource
  has n, :company_areas, :through => Resource
  has n, :competences, :through => Resource
end
