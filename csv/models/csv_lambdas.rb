
class CsvLambdas
  def self.company
    return lambda { |row,builder| builder.parse_company row }
  end
  def self.research_center
    return lambda { |row,builder| builder.parse_research_center row }
  end
end
