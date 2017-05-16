require 'sinatra'
require_relative '../config/environment.rb'
require_relative '../config/database.rb'
require_relative 'csv_parser.rb'
require_relative 'models/csv_lambdas.rb'

DataMapper.auto_migrate!

puts "Importing Companies..."
company_csv_content = File.read(Dir.pwd + '/csv/files/company.csv')
company_parser = CsvParser.new
company_list = company_parser.parse(company_csv_content,CsvLambdas.company)
puts "Saving Companies"
company_list.each_with_index {|company, index| company.insert_to_db; puts "#{index + 1}/#{company_list.length}" }

puts "\n\n"
puts "Importing Research Centers..."
research_center_csv_content = File.read(Dir.pwd + '/csv/files/research_center.csv')
research_center_parser = CsvParser.new(:col_sep => '*')
research_list = research_center_parser.parse(research_center_csv_content, CsvLambdas.research_center)
puts "Saving Research Centers"
research_list.each_with_index {|research_center, index| research_center.insert_to_db; puts "#{index + 1}/#{research_list.length}"  }

Process.kill('TERM', Process.pid)
