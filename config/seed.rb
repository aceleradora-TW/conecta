require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Eldorado")
    Company.create(name: "HPServ")

    ResearchCenter.create(name: "Laboratório de Tratamento de imagens e Geoprocessamento")
    ResearchCenter.create(name: "Laboratório de Sistema Wireless")
  end
  def self.seed_users
    User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', role: 'admin')
    User.create(name: 'user', email: 'user@user.com', password: 'user', role: 'user')
  end
end
