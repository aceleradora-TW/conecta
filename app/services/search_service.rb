class SearchService

  def find_by_competence competence_name
    @competences = Competence.all(conditions: ["lower(name) like ?", competence_name])
  end

  def find_related_competence_institutions compenteces
    competences_id = compenteces.map { |c| c.id }
    @company_competence = CompetenceInstitution.all(conditions: ['competence_id in ? and (competence_value >= 3)', competences_id])
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

  def find_by_research_area research_areas
    @areas = ResearchArea.all(conditions: ["lower(name) like ?", research_areas])
  end

  def find_related_area areas
    research_area_id = areas.map { |a| a.id }
    @rc_area = InstitutionResearchArea.all(conditions: ['research_area_id in ?', research_area_id])
  end

  def find_by_research_field research_fields
    @fields = ResearchField.all(conditions: ["lower(name) like ?", research_fields])
  end

  def find_related_field fields
    research_field_id = fields.map { |f| f.id }
    @rc_field = InstitutionResearchField.all(conditions: ['research_field_id in ?', research_field_id])
  end

end
