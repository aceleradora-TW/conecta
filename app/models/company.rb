require_relative 'institution'
class Company < Institution
  attr_accessor :searched_competences,:searched_segments

  property :size, String
  has n, :segments, :through => Resource
  has n, :company_types, :through => Resource
  has n, :company_areas, :through => Resource

end
