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



  def parse_company(csv_content)
    to_company = lambda { |row| @builder.parse_company row }
    company_list = CSV.parse(csv_content, @parse_options).map(&to_company)
    return company_list
  end

  def parse_research_center(csv_content)
    to_research_center = lambda { |row| @builder.parse_research_center row}
    research_list = CSV.parse(csv_content, @parse_options).map(&to_research_center)
    return research_list
  end




end
