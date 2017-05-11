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
          competence_object = {name: competence_name, area_number:competence_area_number, value: value }
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
end
