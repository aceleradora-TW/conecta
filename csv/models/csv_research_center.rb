class CsvResearchCenter

  attr_accessor :name, :structure_type, :description,:project,
  :research_field, :research_area, :unit, :initials,
  :site, :phone, :contact_name, :email

  def insert_to_db
    research_center = ResearchCenter.new(name: @name,
    structure_type: @structure_type, project: @project, description: @description,
    unit: @unit, initials: @initials )

    field_object = ResearchField.first(name: @research_field)
    if !field_object
      field_object = ResearchField.create(name: @research_field)
    end
    research_center.research_fields.push(field_object)

    area_object = ResearchArea.first(name: @research_area)
    if !area_object
      area_object = ResearchArea.create(name: @research_area)
    end
    research_center.research_areas.push(area_object)

    contact_object = Contact.new(site: @site, phone: @phone, contact_name: @contact_name,
    email: @email)
    research_center.contact = contact_object

    research_center.save
  end
end
