require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Eldorado")
    Company.create(name: "HPServ")

    ResearchCenter.create(name: "Centro de Pesquisas em Biologia Molecular e Funcional")
    ResearchCenter.create(name: "Centro de Terapia Celular")
  end
  def self.seed_users
    User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', role: 'admin')
    User.create(name: 'user', email: 'user@user.com', password: 'user', role: 'user')
  end
end
