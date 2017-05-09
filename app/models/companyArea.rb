
class CompanyArea
    include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :required => true

 # belongs_to, :company#, :through => Resource
end
