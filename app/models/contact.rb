class Contact
  include DataMapper::Resource
  property :id, Serial
  property :site, String
  property :phone,  String
  property :contact_name, String
  property :contact_name_2, String
  property :email,  String, :required => true
  property :email_2,  String

  belongs_to :institution
end
