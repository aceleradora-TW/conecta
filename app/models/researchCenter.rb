require_relative 'institution'

class ResearchCenter < Institution

  property :structureType,    String
  property :project,          String

 # has n, :researchAreas
end
