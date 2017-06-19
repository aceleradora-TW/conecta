require_relative 'database'
class Seed
  def self.seed
    Company.create(name: "Fake Company 1")
    Company.create(name: "Fake Company 2")

    ResearchCenter.create(name: "Fake Research Center 1")
    ResearchCenter.create(name: "Fake Research Center 2")
  end
  def self.seed_users
    User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', role: 'admin')
    User.create(name: 'user', email: 'user@user.com', password: 'user', role: 'user')
  end
end
