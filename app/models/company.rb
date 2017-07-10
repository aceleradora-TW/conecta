require_relative 'institution'
class Company < Institution

  property :size, String
  has n, :company_types, :through => Resource
  has n, :company_areas, :through => Resource

end
