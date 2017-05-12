require_relative 'institution'
#Centro de pesquisa
class ResearchCenter < Institution
  property :structure_type,    String
  property :project,          String

  has n, :research_fields, :through => Resource
  has n, :research_areas, :through => Resource
end
