class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, String

  belongs_to :competence,  :key => true
  belongs_to :company,  :key => true
end
