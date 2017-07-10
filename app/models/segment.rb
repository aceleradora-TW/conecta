class Segment
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  has n, :institution, :through => Resource
end
