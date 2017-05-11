#Endereço das Instituições
class Location
  include DataMapper::Resource
  property :id,              Serial
  property :state,           String, :required => true
  property :city,            String, :required => true
  property :neighborhood,    String
  property :street,          String, :required => true
  property :number,          String, :required => true
  property :complement,      String

  belongs_to :institution, :required => false
end
