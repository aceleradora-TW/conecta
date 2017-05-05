
class Contact
  include DataMapper::Resource
  property :id,         Serial
  property :site,       String
  property :phone,      String
  property :contactName, String
  property :email,       String, :required => true

  belongs_to :institution
end
