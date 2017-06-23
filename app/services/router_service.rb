require_relative "../services/search_service"

class RouterService

  def return_found_values value_sql, search_type
    search_service = SearchService.new
    case search_type
    when 'competencia' then
      return_competence value_sql, search_service, :company
    when 'segmento' then
      return_segment value_sql, search_service
    when 'empresa' then
      return_company value_sql, search_service
    when 'centro-pesquisa' then
      return_research_center value_sql, search_service
    when 'estrutura-pesquisa-competencia' then
      return_competence value_sql, search_service, :research_center
    end
  end

  def return_competence value_sql, search_service, institution_type
    @institutions_searched = []
    @competences = search_service.find_by_competence(value_sql)
    if @competences.length != 0
      @institution_competence = search_service.find_related_competence_institutions(@competences,institution_type)
      @institution_competence.each do |single_competence|
        local_institution = single_competence.institution
        index_of_institution = @institutions_searched.index local_institution
        if !index_of_institution
          local_institution.searched_competences = [single_competence]
          @institutions_searched.push(local_institution)
        else
          @institutions_searched[index_of_institution].searched_competences.push(single_competence)
        end
      end
    end
    @institutions_searched
  end

  def return_segment value_sql, search_service
    @companies_with_segment = []
    @segments = search_service.find_by_segment(value_sql)

    if @segments.length != 0
      @company_segments = search_service.find_related_segment(@segments)
      @company_segments.each do |single_segment|
        local_company = single_segment.company
        if !@companies_with_segment.include? local_company
          @companies_with_segment.push(local_company)
        end
      end
    end
    @companies_with_segment
  end

  def return_company value_sql, search_service
    search_service.find_by_company(value_sql)

  end

  def return_research_center  value_sql, search_service
    search_service.find_by_research_center(value_sql)
  end

end
