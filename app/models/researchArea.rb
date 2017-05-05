

class ResearchArea
    include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true

 has n, :researchCenter#, :through => Resource
end
