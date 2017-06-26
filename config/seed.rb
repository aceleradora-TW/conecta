require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Eldorado")
    Company.create(name: "HPServ")

    competence_1 = Competence.create(name: "Toxicologia")
    competence_2 = Competence.create(name: "Farmacologia")

    centro_1 = ResearchCenter.create(name: "Centro de Pesquisas em Biologia Molecular e Funcional")
    centro_2 = ResearchCenter.create(name: "Centro de Terapia Celular")

    CompetenceInstitution.create(institution: centro_1, competence: competence_1, competence_value: -1)
    CompetenceInstitution.create(institution: centro_2, competence: competence_2, competence_value: 4)
  end
  def self.seed_users
    User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', role: 'admin')
    User.create(name: 'user', email: 'user@user.com', password: 'user', role: 'user')
  end
end
