class Segment
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String, :required => true

  belongs_to :company, :required => false
end
