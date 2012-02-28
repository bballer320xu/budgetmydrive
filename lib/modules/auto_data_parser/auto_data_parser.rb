# http://www.fueleconomy.gov/feg/download.shtml

require "spreadsheet"

module ParseDatafile
  
  
  def process_all
    Spreadsheet.client_encoding = 'UTF-8'
    
    Dir["datafiles/*.xlsx"].each do |file|
      book = Spreadsheet.open file
      sheet1 = book.worksheet 0
      headers = []
      sheet1.each_with_index do |row, index|
        if index > 0
          #Data
        else
          # Headers
        end
      end
    end
    
     
  end
  
  
  
  
end