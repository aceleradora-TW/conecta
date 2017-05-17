class CsvCompany
  attr_accessor :name, :size, :description,:segments,:types,:competences, :competence_value
  def initialize
    @competence_area_array = nil
    create_competence_area_array()
  end

  def insert_to_db

    company = Company.new(name: @name, size: @size)

    @segments.each do |segment|
      segment_object = Segment.first(name: segment)
      if !segment_object
        segment_object = Segment.create(name: segment)
      end
      company.segments.push(segment_object)
    end
    @types.each do |type|
      type_object = CompanyType.first(name: type)
      if !type_object
        type_object = CompanyType.create(name: type)
      end
      company.company_types.push(type_object)
    end
    @competences.each do |competence|

      competence_object = Competence.first(name: competence[:name])
      if !competence_object
        competence_area = @competence_area_array[competence[:area_number].to_i]
        competence_object = Competence.create(name: competence[:name], competence_area: competence_area)
      end
      competence_institution_object = CompetenceInstitution.new(competence_value: competence[:competence_value] )
      competence_institution_object.company = company
      competence_institution_object.competence = competence_object
      competence_institution_object.save

    end


    company.save

    puts company.inspect

  end
  def create_competence_area_array
    if !@competence_area_array
      @competence_area_array = [
        "",
        CompetenceArea.create(name: "Hardware"),
        CompetenceArea.create(name: "Software"),
        CompetenceArea.create(name: "Administração"),
        CompetenceArea.create(name: "Serviços"),
        CompetenceArea.create(name: "Soluções Ecológicas"),
        CompetenceArea.create(name: "Comercial")
      ]
    end
  end
end
