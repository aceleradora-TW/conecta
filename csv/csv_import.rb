require 'sinatra'
require_relative '../config/environment.rb'
require_relative '../config/database.rb'
require_relative 'csv_parser.rb'

DataMapper.auto_migrate!

company_csv_content = File.read(Dir.pwd + '/csv/files/company.csv')
company_parser = CsvParser.new
company_list = company_parser.parse_company(company_csv_content)
company_list.each {|company| company.insert_to_db }


research_center_csv_content = File.read(Dir.pwd + '/csv/files/research_center.csv')
research_center_parser = CsvParser.new(:col_sep => '*')
research_center_parser.parse_research_center(research_center_csv_content)

Process.kill('TERM', Process.pid)
