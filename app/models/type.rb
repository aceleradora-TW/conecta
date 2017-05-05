class Type
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String, :required => true
  has n, :companies
end
