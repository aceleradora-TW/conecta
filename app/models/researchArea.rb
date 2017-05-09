
class ResearchArea
    include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true

 # belongs_to, :researchCenter#, :through => Resource
end
