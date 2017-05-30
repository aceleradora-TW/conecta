require_relative "../services/search_service"

class RouterService


  def return_found_values value_sql, search_type
    search_service = SearchService.new
    case search_type
    when 'competencia' then
      return_competence value_sql, search_service
    when 'segmento' then
      return_segment value_sql, search_service
    when 'empresa' then
      return_company value_sql, search_service
    when 'centro-pesquisa' then
      return_research_center value_sql, search_service
    when 'area-pesquisa' then
      return_research_area value_sql, search_service
    when 'eixo-pesquisa' then
      return_research_field value_sql, search_service
    end
  end

  def return_competence value_sql, search_service
    @companies_searched = []
    @competences = search_service.find_by_competence(value_sql)
    if @competences.length != 0
      @company_competence = search_service.find_related_competence_institutions(@competences)
      @company_competence.each do |single_cmp_competence|
        local_company = single_cmp_competence.company
        if !@companies_searched.include? local_company
          @companies_searched.push(local_company)
        end
      end
    end
    @companies_searched
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

  def return_research_area value_sql, search_service
    @rc_with_area = []
    @area = search_service.find_by_research_area(value_sql)
    if @area.length != 0
      @rc_area = search_service.find_related_area(@area)
      @rc_area.each do |single_area|
        local_rc = single_area.research_center
        if !@rc_with_area.include? local_rc
          @rc_with_area.push(local_rc)
        end
      end
    end
     @rc_with_area
  end

  def return_research_field value_sql, search_service
    @rc_with_field = []
    @field = search_service.find_by_research_field(value_sql)
    if @field.length != 0
      @rc_field = search_service.find_related_field(@field)
      @rc_field.each do |single_field|
        local_rc = single_field.research_center
        if !@rc_with_field.include? local_rc
          @rc_with_field.push(local_rc)
        end
      end
    end
     @rc_with_field
  end
end
