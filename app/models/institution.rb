#Instituições (empresas e centros de pesquisa)
class Institution
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :description, Text
  property :logo, String
  property :type, Discriminator

  has n, :locations
  has 1, :contact
end
