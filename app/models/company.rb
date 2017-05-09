require_relative 'institution'

class Company < Institution
  property :size,       String
  has n, :companyTypes
  has n, :companyAreas
end
