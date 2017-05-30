class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, Integer

  belongs_to :competence,  :key => true
  belongs_to :company,  :key => true

  def competence_value_calculated
    competence_value > 1 ? (competence_value - 1).to_s + "/5" : "0/5"
  end
end
