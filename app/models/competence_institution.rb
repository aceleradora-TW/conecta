class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, Integer

  belongs_to :competence,  :key => true
  belongs_to :company,  :key => true
end
