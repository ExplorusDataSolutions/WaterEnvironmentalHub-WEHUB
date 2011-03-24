require 'rubygems'
require 'roo'

class SpreadsheetTranslator
  
  def initialize(filename, uploads_directory='public/uploads', spreadsheets_directory='tmp/spreadsheets')
    @filename = filename
    @spreadsheets_directory = spreadsheets_directory
    
    @spreadsheet = Roo::Spreadsheet.open("#{path}/#{uploads_directory}/#{@filename}")    
    @spreadsheet.default_sheet = @spreadsheet.sheets.first
    
    save_as_csv
    delete_fieldnames_row
  end
  
  def fieldnames
    @spreadsheet.row(@spreadsheet.first_row)
  end
  
  def filename
    File.path(filename_csv)
  end
  
  private 
  
  def filename_csv
    "#{path}/#{@spreadsheets_directory}/#{@filename.split('.')[0]}.csv"
  end
    
  def save_as_csv
    @spreadsheet.to_csv(filename_csv)
  end
  
  # The Roo Gem (Spreadsheet manipulation) doesn't support editing spreadsheets
  #  since I can't edit the spreadsheet, I'm deleting the fieldnames through the commandline  
  def delete_fieldnames_row
    filename_temp = "#{path}/#{@spreadsheets_directory}/#{@filename.split('.')[0]}.processed.csv"
    # Clean up the first line, it contains the field names
    %x[tail -n +2 #{filename_csv} > #{filename_temp}]
    # Clean up the csv file, remove double newlines    
    %x[sed ':a;N;$!ba;s/\\n\\n/\\n/g' #{filename_temp} > #{filename_csv}]
    # Clean up the temp file
    %x[rm #{filename_temp}]
  end
  
  def path
    if defined? RAILS_ROOT
      "#{RAILS_ROOT}"
    else
      File.realpath("../../")
    end
  end

end

=begin
test = SpreadsheetTranslator.new('PAMCombined.xls')
puts test.delete_fieldnames_row
=end
