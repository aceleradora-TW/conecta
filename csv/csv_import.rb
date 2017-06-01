require_relative 'csv_mappers.rb'

module CsvImport

  def self.run

    puts "Importing Companies..."

    companies = CsvMappers.parse_company()

    puts "Saving Companies"

    companies.each_with_index do |company, index|
      company.insert_to_db
      puts "#{index + 1}/#{companies.length}"
    end

    puts "\n\n"

    puts "Importing Research Centers..."

    research_centers = CsvMappers.parse_research_center()

    puts "Saving Research Centers"

    research_centers.each_with_index do |center, index|
      center.insert_to_db
      puts "#{index + 1}/#{research_centers.length}"
    end

  end

end
