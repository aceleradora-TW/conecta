
require 'csv'

csv_text = File.read(Dir.pwd + '/config/csv/EMPRESASDADOSlimpo.csv')

csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8', :col_sep => ',')
companies = []
headers = csv.first.to_hash

count = 0

headers.each do |col|
  row_value = col[count]
  if(row_value != nil)
    row_value = row_value.strip
    if(row_value != "information")
      companies.push(row_value)
    end
  end
end

puts companies




#esboço da continuação do código - quase pronto
# csv.each do |row|
#   row = row.to_hash
#   information = row['information']
#   info_value = row[company] || ""
#
#   if information == "size"
#
#     company.size =
#   end
#
# end
# company.save
# #break
# end
