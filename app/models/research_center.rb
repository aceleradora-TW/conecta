require_relative 'institution'
#Centro de pesquisa
class ResearchCenter < Institution
  property :structure_type,    String
  property :project,          String
  property :initials, String
  property :unit, String

  has n, :research_fields, :through => Resource
  has n, :research_areas, :through => Resource
end
