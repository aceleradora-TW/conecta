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
    to_research_center = lambda { |row| CsvResearchCenter.new row }
    CSV.parse(csv_content, @parse_options).map(&to_research_center)
  end
end

#
#
# csv_text = File.read(Dir.pwd + '/config/csv/EMPRESASDADOSlimpo.csv')
#
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8', :col_sep => ',')
# companies = []
# headers = csv.first.to_hash
# #
# # if(row_value != "information")
# #   company_object = Company.new(name: header_value)
# #   companies.push(company_object)
# # end
#
# #Create Areas
# area_information = [
#   "",
#   CompanyArea.create(name: "Hardware"),
#   CompanyArea.create(name: "Software"),
#   CompanyArea.create(name: "Administração"),
#   CompanyArea.create(name: "Serviços"),
#   CompanyArea.create(name: "Soluções Ecológicas"),
#   CompanyArea.create(name: "Comercial")
# ]
# #Get Companies
# headers.each do |col|
#   row_value = col[0]
#   if(row_value != nil)
#     row_value = row_value.strip
#     if(row_value != "information")
#       company_object = Company.new(name: row_value)
#       companies.push(company_object)
#     end
#   end
# end
#
# #save Segment, Area, CompanyType, Competences in DAtabases
# information_object = {}
# csv.each do |row|
#   row = row.to_hash
#   information = row['information']
#   if information.start_with? "Segmento_"
#     segment_name = information.sub "Segmento_", ""
#     segment_object = Segment.create(name: segment_name)
#     information_object[information] = segment_object
#   elsif information.start_with? "Perfil_"
#     type_name = information.sub "Perfil_", ""
#     type_object = CompanyType.create(name: type_name)
#     information_object[information] = type_object
#   elsif information.start_with? "Capacidades_"
#     # Capacidades_2-1 Eng Software_Desenvolvimento SW Client Server
#     competence_clean = information.sub! "Capacidades_", ""    # 2-1 Eng Software_Desenvolvimento SW Client Server
#     competence_area_number = competence_clean[0]              # 2
#     competence_name = competence_clean.sub(/\d[\W+]\d+ /,"")   # Eng Software_Desenvolvimento SW Client Server
#     competence_company_area = area_information[competence_area_number.to_i]# CompanyArea::{ name: Software}
#     competence_object = Competence.create(name: competence_name, companyArea: competence_company_area)
#     information_object[information] = competence_object
#   end
# end
#
# companies.each do |company|
#   csv.each do |row|
#     row = row.to_hash
#     information = row['information']
#     info_value = row[company.name] || ""
#
#     if information == "size"
#       size_name = ""
#       if info_value == "1"
#         size_name = "Grande"
#       elsif info_value == "2"
#         size_name = "Média"
#       elsif info_value == "3"
#         size_name = "Pequena"
#       end
#       company.size = size_name
#     elsif information.start_with? "Segmento_"
#       segment_object = information_object[information]
#       if info_value.strip == "1"
#         company.segments.push segment_object
#         company.save
#         puts segment_object.name + "[" + segment_object.id.to_s + "]" + " inserido na empresa " + company.name
#       end
#     end
#   end
#   company.save
#
# end
