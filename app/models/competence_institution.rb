class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, Integer

  belongs_to :competence,  :key => true
  belongs_to :company,  :key => true

  def competence_value_calculated
    if competence_value > 0
      return (competence_value - 1).to_s + "/5"
    end
    return 0
  end
end
