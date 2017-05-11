#Eixo tematico("area") de Centros de pesquisa
class ResearchField
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true

  belongs_to :researchCenter, :required => false
end
