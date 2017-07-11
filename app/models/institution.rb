class Institution
  attr_accessor :searched_competences,:searched_segments

  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, Text
  property :logo, String
  property :address, String
  property :type, Discriminator
  property :status, Boolean, :default  => false

  has n, :segments, :through => Resource
  has n, :competences, :through => :competence_institutions
  has n, :competence_institutions
  has 1, :contact
  has 1, :user

  def featured_competences
    if @searched_competences and @searched_competences.length > 0
      ordered_competences = @searched_competences.sort{|a,b| b.competence_value_calculated_integer <=> a.competence_value_calculated_integer}
      return ordered_competences.slice(0,3)
    else
      ordered_competences = self.competence_institutions.slice(0,3)
      ordered_competences = ordered_competences.sort{|a,b| b.competence_value_calculated_integer <=> a.competence_value_calculated_integer}
    end
  end

  def grouped_competences
    filtered_competences = {}
    competence_institutions.each do |competence_all|
      if filtered_competences.key?(competence_all.competence.competence_area.name)
        competence_area_array = filtered_competences[competence_all.competence.competence_area.name]
        competence_area_array.push(competence_all.competence.name  + competence_all.competence_value_calculated)
      else
        competence_area_array = [competence_all.competence.name + competence_all.competence_value_calculated]
        filtered_competences[competence_all.competence.competence_area.name] = competence_area_array
      end
    end
    filtered_competences.each_key do |competence_area|
      filtered_competences[competence_area].sort_by!{ |competence| competence.downcase }
    end
    return filtered_competences
  end

  def grouped_competences_research
    filtered_competences = {}
    competence_institutions.each do |competence_all|
      if filtered_competences.key?(competence_all.competence.competence_area.name)
        competence_area_array = filtered_competences[competence_all.competence.competence_area.name]
        competence_area_array.push(competence_all.competence.name)
      else
        competence_area_array = [competence_all.competence.name]
        filtered_competences[competence_all.competence.competence_area.name] = competence_area_array
      end
    end
    return filtered_competences
  end
end
