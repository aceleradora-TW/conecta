class CsvCompany
  attr_accessor :name, :size, :description,:segments,:types,:competences

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
        competence_object = Competence.create(name: competence[:name])
      end
      company.competences.push(competence_object)
    end
    company.save
    # puts company.company_types.inspect

  end
end
