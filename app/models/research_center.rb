require_relative 'institution'
#Centro de pesquisa
class ResearchCenter < Institution
  property :structureType,    String
  property :project,          String
  # has n, :researchAreas
end
