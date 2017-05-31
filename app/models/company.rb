require_relative 'institution'
class Company < Institution
  property :size, String
  has n, :segments, :through => Resource
  has n, :company_types, :through => Resource
  has n, :company_areas, :through => Resource
  has n, :competences, :through => :competece_institutions
  has n, :competence_institutions

  def grouped_competences
    filtered_competences = {}
    competence_institutions.each do |competence_all|
      if filtered_competences.key?(competence_all.competence.competence_area.name)
        competence_area_array = filtered_competences[competence_all.competence.competence_area.name]
        competence_area_array.push(competence_all.competence.name + " | " + competence_all.competence_value_calculated)
      else
        competence_area_array = [competence_all.competence.name + " | " + competence_all.competence_value_calculated]
        filtered_competences[competence_all.competence.competence_area.name] = competence_area_array
      end
    end
    return filtered_competences
  end

end
