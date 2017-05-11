#Contato das Instituições
class Contact
  include DataMapper::Resource
  property :id, Serial
  property :site, String
  property :phone,  String
  property :contact_name, String
  property :email,  String, :required => true

  belongs_to :institution
end
