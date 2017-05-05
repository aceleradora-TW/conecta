
class Institution
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String, :required => true
  property :description,       String, :required => true
  property :logo,       String

  has 1, :contact
end
