require_relative 'models/csv_company'
class InstitutionBuilder
  def parse_company row
    company_csv = CsvCompany.new
    @segments, @types, @competences = [],[],[]
    row.each do |col|
      header = col[0] || ""
      value = col[1] || ""
      value.strip!
      if header == "company"
        @name = value
      elsif header == "size"
        case value
        when "1"
          @size = "Grande"
        when "2"
          @size = "Medio"
        when "3"
          @size = "Pequeno"
        end
      elsif header == "description"
        @description = value
      elsif header.start_with? "Segmento_"
        segment_name = header.sub "Segmento_", ""
        @segments.push(segment_name) if value == "1"
      elsif header.start_with? "Perfil_"
        type_name = header.sub "Perfil_", ""
        @types.push(type_name) if value == "1"
      elsif header.start_with? "Capacidades_"
        competence_clean = header.sub "Capacidades_", ""
        competence_area_number = competence_clean[0]
        competence_name = competence_clean.sub(/\d[\W+]\d+ /,"")
        if value != ""
          competence_object = {name: competence_name, area_number:competence_area_number, competence_value: value }
          @competences.push(competence_object)
        end
      end
    end
    company_csv.name = @name
    company_csv.size = @size
    company_csv.description  = @description
    company_csv.segments = @segments
    company_csv.types = @types
    company_csv.competences = @competences

    return company_csv
  end

  def parse_research_center row
    research_center_csv = CsvResearchCenter.new
    @research_field = []
    row.each do |col|
      header = col[0] || ""
      value = col[1] || ""
      value.strip!
      if header == "ESTRUTURA_PESQUISA"
        @name = value
      elsif header == "DESCRIÇÃO"
        @description = value
      elsif header == "TIPO_ESTRUTURA"
        @structure_type = value
      elsif header ==  "AREA_PESQUISA"
        @research_area = value
      elsif header ==  "EIXO_TEMATICO"
        @research_field = value
      elsif header ==  "PROJETOS"
        @project = value
      elsif header ==  "E-MAIL"
        @email = value
      elsif header ==  "TELEFONE"
        @phone = value
      elsif header ==  "SITE"
        @site = value
      elsif header ==  "COORDENADOR"
        @contact_name = value
      elsif header ==  "UNIDADE"
        @unit = value
      elsif header ==  "SIGLA"
        @initials = value
      end
    end

    research_center_csv.name = @name
    research_center_csv.structure_type = @structure_type
    research_center_csv.description  = @description
    research_center_csv.project = @project
    research_center_csv.unit = @unit
    research_center_csv.initials = @initials

    research_center_csv.research_area = @research_area
    research_center_csv.research_field = @research_field

    research_center_csv.email = @email
    research_center_csv.phone = @phone
    research_center_csv.site = @site
    research_center_csv.contact_name = @contact_name

    return research_center_csv
  end
end
