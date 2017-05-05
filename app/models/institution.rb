
class Institution
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String, :required => true
  property :description,       String, :required => true
  property :logo,       String

  property :type, Discriminator

  has n, :locations, :required => true
  has 1, :contact, :required => true
end
