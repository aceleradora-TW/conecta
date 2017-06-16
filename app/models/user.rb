class User
  attr_accessor :name,:email
  def initialize(name,email)
    @name = name
    @email = email
  end
  def self.find_or_create_from_auth_hash(hash)
    return User.new("Carloas","carloas@uol.com")
  end
end
