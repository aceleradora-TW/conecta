class Contact
  include DataMapper::Resource
  property :id, Serial
  property :site, String
  property :phone,  String
  property :contact_name, String
  property :secondary_contact_name, String
  property :email,  String, :required => true
  property :secondary_email,  String

  belongs_to :institution
end
