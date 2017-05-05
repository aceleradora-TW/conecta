
class Contact
  include DataMapper::Resource
  property :id,         Serial
  property :site,       String

  belongs_to :institution
end
