require_relative 'models/csv_company'
class InstitutionBuilder
  def parse_company row
    @status = true
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
        when "5"
          @size = "Medio"
        when "10"
          @size = "Pequeno"
        end
      elsif header == "description"
        @description = value
      elsif header == "status" and value != "1"
        @status = false
      elsif header == "unit"
        @address_info = value
      elsif header == "logo"
        @logo = value
      elsif header == "responsavel"
        @contact_name = value
      elsif header == "site"
        @contact_site = value
      elsif header == "email"
        @contact_email = value
      elsif header == "phone" and @phone == nil and value != ""
        @contact_phone = value
      elsif header.start_with? "Segmento_"
        segment_name = header.sub "Segmento_", ""
        segment_name.gsub! "_", " "
        @segments.push(segment_name) if value == "1"
      elsif header.start_with? "Perfil_"
        type_name = header.sub "Perfil_", ""
        type_name.gsub! "_", " "
        @types.push(type_name) if value == "1"
      elsif header.start_with? "Capacidade_"
        competence_clean = header.sub "Capacidade_", ""
        competence_area_number = competence_clean[0]
        competence_name = competence_clean.sub(/\d[\W_]+\d+[\W_]+/,"")
        competence_name.gsub! "_", " "
        if value != ""
          competence_value = value.to_i || 0
          if competence_value != 0
            competence_value = (competence_value / 2).ceil
            competence_object = {name: competence_name, area_number:competence_area_number, competence_value: competence_value }
            @competences.push(competence_object)
          end
        end
      end
    end
    company_csv.name = @name
    company_csv.size = @size
    company_csv.description  = @description
    company_csv.logo  = @logo
    company_csv.segments = @segments
    company_csv.types = @types
    company_csv.competences = @competences
    company_csv.contact_name = @contact_name
    company_csv.contact_site = @contact_site
    company_csv.contact_email = @contact_email
    company_csv.contact_phone = @contact_phone
    company_csv.address_info = @address_info
    company_csv.status = @status
    return company_csv
  end

  def parse_research_center row
    @status = true
    research_center_csv = CsvResearchCenter.new
    @segments, @competences = [],[]
    row.each do |col|
      header = col[0] || ""
      value = col[1] || ""
      value.strip!
      if header == "NOME_ESTRUTURA"
        @name = value
      elsif header == "SIZE"
        case value
        when "3"
          @size = "Grande"
        when "2"
          @size = "Medio"
        when "1"
          @size = "Pequeno"
        end
      elsif header == "ENDERECO"
        @address = value
      elsif header == "STATUS" and value != "1"
        @status = false
      elsif header == "RESPONSAVEL"
        contact_names = value.split.map { |name| name.capitalize }
        @contact_name = contact_names.join(" ")
      elsif header == "DESCRICAO"
        @description = value
      elsif header ==  "SITE"
        @site = value
      elsif header ==  "FONE"
        @phone = value
      elsif header ==  "EMAIL"
        @email = value
      elsif header == "COMPETENCIAS"
        competence_names = value.split(",")
        @competences = competence_names.map { |competence_name| competence_name.strip.capitalize }
      elsif header.start_with? "Segmento_"
        segment_name = header.sub "Segmento_", ""
        @segments.push(segment_name) if value == "1"
      end
    end

    research_center_csv.name = @name
    research_center_csv.address_info = @address
    research_center_csv.contact_name = @contact_name
    research_center_csv.description  = @description
    research_center_csv.site = @site
    research_center_csv.phone = @phone
    research_center_csv.email = @email
    research_center_csv.competences = @competences
    research_center_csv.status = @status
    research_center_csv.segments = @segments

    return research_center_csv
  end
end
