class CsvResearchCenter
  attr_accessor :name, :structure_type, :description,:project,:research_field, :research_area

  def insert_to_db
    research_center = ResearchCenter.new(name: @name, structure_type: @structure_type, project: @project)

    #codigo comentado pois ainda nao esta finalizado
    #   field_object = ResearchField.first(name: @field)
    #   if !field_object
    #     field_object = ResearchField.create(name: field)
    #   end
    #   research_center.fields.push(field_object)
    #
    #
    # @research_area.each do |area|
    #   area_object = ResearchArea.first(name: area)
    #   if !area_object
    #     area_object = ResearchArea.create(name: area)
    #   end
    #   research_center.areas.push(area_object)
    # end

    research_center.save
  end
end
