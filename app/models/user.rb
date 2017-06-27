require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  property :id, Serial
  property :name, String, :required => false
  property :email, String, :required => true
  property :password_hash, String, :required => true
  property :role, String, :required => true
  belongs_to :institution, :required => false

  def is_admin
    return @role == 'admin'
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
