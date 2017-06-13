require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Eldorado")
    Company.create(name: "HPServ")

    ResearchCenter.create(name: "Laboratório de Tratamento de imagens e Geoprocessamento")
    ResearchCenter.create(name: "Laboratório de Sistema Wireless")
  end
end
