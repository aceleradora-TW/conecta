class CompetenceInstitution
  include DataMapper::Resource

  property :competence_value, Integer

  belongs_to :competence,  :key => true
  belongs_to :institution,  :key => true


  def competence_value_calculated
    #competence_value > 1 ? (competence_value - 1).to_s + "/5" : "0/5"
    stars = ""
    competence_real = (competence_value - 1)
    for i in 1..5
      if i <= competence_real
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
