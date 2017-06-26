require_relative 'database'
class Seed
  def self.seed
    company_1 = Company.create(name: "Eldorado")
    company_2 = Company.create(name: "HPServ")

    competence_area_company = CompetenceArea.create(name: "Software")

    competence_company_1 = Competence.create(name: "Testes", competence_area: competence_area_company)
    competence_company_2 = Competence.create(name: "Desenvolvimento Mobile", competence_area: competence_area_company)

    CompetenceInstitution.create(institution: company_1, competence: competence_company_1, competence_value: -1)
    CompetenceInstitution.create(institution: company_2, competence: competence_company_2, competence_value: 4)

    research_center_1 = ResearchCenter.create(name: "Centro de Pesquisas em Biologia Molecular e Funcional")
    research_center_2 = ResearchCenter.create(name: "Centro de Terapia Celular")

    competence_area_research_center = CompetenceArea.create(name: "ResearchCenter")

    competence_research_center_1 = Competence.create(name: "Toxicologia", competence_area: competence_area_research_center)
    competence_research_center_2 = Competence.create(name: "Farmacologia", competence_area: competence_area_research_center)

    CompetenceInstitution.create(institution: research_center_1, competence: competence_research_center_1, competence_value: -1)
    CompetenceInstitution.create(institution: research_center_2, competence: competence_research_center_2, competence_value: 4)

  end
  def self.seed_users
    User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', role: 'admin')
    User.create(name: 'user', email: 'user@user.com', password: 'user', role: 'user')
  end
end
