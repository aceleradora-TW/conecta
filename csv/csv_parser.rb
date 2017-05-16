require 'csv'
require_relative 'models/csv_company'
require_relative 'models/csv_research_center'
require_relative 'institution_builder'

class CsvParser

  def initialize(header: true, encoding: 'UTF-8', col_sep: ',')
    @builder = InstitutionBuilder.new
    @parse_options = {
      :headers => header,
      :encoding => encoding,
      :col_sep => col_sep
    }
  end

  def parse(csv_content, builder_lambda)
    parsed_data = CSV.parse(csv_content, @parse_options).map{ |row| builder_lambda.call(row,@builder)}
    return parsed_data
  end
end
