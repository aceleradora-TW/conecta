require_relative 'competence'
class CompetenceArea
  include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true
  has n,:competences
end
