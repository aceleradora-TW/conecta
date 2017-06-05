require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Fake Company 1")
    Company.create(name: "Fake Company 2")

    ResearchCenter.create(name: "Fake Research Center 1")
    ResearchCenter.create(name: "Fake Research Center 2")
  end
end
