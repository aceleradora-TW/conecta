class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, Integer

  belongs_to :competence,  :key => true
  belongs_to :institution,  :key => true


  def competence_value_calculated

    if competence_value < 0
      return "<i class='material-icons u-colorGreen u-widthIcon'>check circle</i>"
    end
    stars = ""
    for i in 1..5
      if i <= competence_value
        stars += "<i class='material-icons u-colorGold u-widthIcon'>star</i>"
      else
        stars += "<i class='material-icons u-colorGold u-widthIcon'>star_border</i>"
      end
    end
    return stars
  end

  def competence_value_calculated_integer
    #competence_value > 1 ? (competence_value - 1): 0
    competence_value
  end
end
