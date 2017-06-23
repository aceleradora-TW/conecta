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
    @segments, @competences = [],[]
    row.each do |col|
      header = col[0] || ""
      value = col[1] || ""
      value.strip!
      if header == "NOME_ESTRUTURA"
        @name = value
      elsif header == "ENDERECO"
        @address = value
      elsif header == "RESPONSAVEL"
        contact_names = value.split.map { |name| name.capitalize }
        @contact_name = contact_names.join(" ")
      elsif header == "DESCRICAO"
        @description = value
      elsif header ==  "SITE"
        @site = value
      elsif header == "COMPETENCIAS"
        competence_names = value.split(",")
        @competences = competence_names.map { |competence_name| competence_name.strip.capitalize }
      # elsif header.start_with? "SEGMENTO_"
      #   segment_name = header.sub "SEGMENTO_", ""
      #   @segments.push(segment_name) if value == "SIM"
      end
    end

    research_center_csv.name = @name
    research_center_csv.address_info = @address
    research_center_csv.contact_name = @contact_name
    research_center_csv.description  = @description
    research_center_csv.site = @site
    research_center_csv.competences = @competences

    return research_center_csv
  end
end
