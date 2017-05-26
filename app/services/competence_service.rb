class CompetenceService

  def find_by_name competence_name
    @competences = Competence.all(:conditions => ["lower(name) like ?", competence_name])
  end

    def find_related_institutions compenteces
      competences_id =   compenteces.map { |c| c.id }
      @company_competence = CompetenceInstitution.all(conditions: ['competence_id in ? and (competence_value >= 4)', competences_id])
    end

end
