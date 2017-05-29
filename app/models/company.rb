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
    competence_institutions.each do |comp_all|
      if filtered_competences.key?(comp_all.competence.competence_area.name)
        competence_area_array = filtered_competences[comp_all.competence.competence_area.name]
        competence_area_array.push(comp_all.competence.name + " | " + comp_all.competence_value.to_s + " | ")
      else
        competence_area_array = [comp_all.competence.name + " | " + comp_all.competence_value.to_s + " | "]
        filtered_competences[comp_all.competence.competence_area.name] = competence_area_array
      end
    end
    return filtered_competences
  end

end
