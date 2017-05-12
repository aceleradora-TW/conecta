#Area de Pesquisa
class ResearchArea
  include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true
  
  has n, :research_centers, :through => Resource
end
