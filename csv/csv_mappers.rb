require 'pathname'
require_relative '../config/environment.rb'
require_relative '../config/database.rb'
require_relative 'csv_parser.rb'
require_relative 'models/csv_lambdas.rb'

module CsvMappers

  CSV_LOCATION = File.join(Dir.pwd, 'csv', 'files')
  COMPANY_FILE_NAME = 'company.csv'
  RESEARCH_CENTER_FILE_NAME = 'research_center.csv'

  class CsvFileMapper

    def initialize(file_name, parser, lambda_processor)
      @file_name = file_name
      @parser = parser
      @lambda_processor = lambda_processor
    end

    def parse

      file_path = Pathname.new(File.join(CSV_LOCATION, @file_name))

      if !file_path.exist?
        abort("#{@file_name} could not be found under #{file_path.to_s}. Did you forget to put it there?")
      end

      @parser.parse(File.read(file_path), @lambda_processor)
    end

  end

  def self.parse_company
    (CsvFileMapper.new(
      COMPANY_FILE_NAME,
      CsvParser.new(:col_sep => '*'),
      CsvLambdas.company
    )).parse()
  end

  def self.parse_research_center
    (CsvFileMapper.new(
      RESEARCH_CENTER_FILE_NAME,
      CsvParser.new(:col_sep => '*'),
      CsvLambdas.research_center
    )).parse()
  end

end
