
class Location
  include DataMapper::Resource
  property :id,              Serial
  property :city,            String, :required => true
  property :neighborhood,    String, :required => true
  property :street,          String, :required => true
  property :number,          String, :required => true
  property :complement,      String

  belongs_to :institution
end
