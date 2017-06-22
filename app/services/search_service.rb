class SearchService

  def find_by_competence competence_name
    @competences = Competence.all(conditions: ["lower(name) like ?", competence_name])
  end

  def find_related_competence_institutions compenteces
    competences_id = compenteces.map { |c| c.id }
    @company_competence = CompetenceInstitution.all(conditions: ['competence_id in ? and (competence_value >= 3 OR competence_value < 0)', competences_id])
  end

  def find_by_segment segment_name
    @segments = Segment.all(conditions: ["lower(name) like ?", segment_name])
  end

  def find_related_segment segments
    segments_id = segments.map { |s| s.id }
    @company_segments = InstitutionSegment.all(conditions: ['segment_id in ?', segments_id])
  end

  def find_by_company companies
    @companies = Company.all(conditions: ["lower(name) like ?", companies])
  end

  def find_by_research_center research_centers
    @research_center = ResearchCenter.all(conditions: ["lower(name) like ?", research_centers])
  end

end
