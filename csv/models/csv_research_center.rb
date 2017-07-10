class CsvResearchCenter
  attr_accessor :name, :description, :address_info,
  :site, :phone, :contact_name, :email, :competences, :segments, :status

  @@competence_area_research_center = nil

  def initialize
    CsvResearchCenter.create_competence_area_research_center()
  end

  def insert_to_db
    rc_object = ResearchCenter.first(name: @name)
    if !rc_object
      @email = @email || "exemplo@domain.com"
      research_center = ResearchCenter.new(name: @name, description: @description, status: @status)
      research_center.address = @address_info
      contact_object = Contact.new(site: @site, phone: @phone, contact_name: @contact_name,
      email: @email)
      research_center.contact = contact_object

      @competences.each do |competence|
        competence_object = Competence.first(name: competence)
        if !competence_object
          competence_area = @@competence_area_research_center[0]
          competence_object = Competence.create(name: competence, competence_area: competence_area)
        end
        competence_institution_object = CompetenceInstitution.new(competence_value: -1)
        competence_institution_object.institution = research_center
        competence_institution_object.competence = competence_object
        competence_institution_object.save
      end
      research_center.save
    end
  end

  def self.create_competence_area_research_center
    if !@@competence_area_research_center
      @@competence_area_research_center = [
        CompetenceArea.create(name: "Estruturas de Pesquisa")
      ]
    end
  end
end
