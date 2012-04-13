require 'csv'

connection_string = "psql -U catalogue -d catalogue_development"

csv_files = Dir.glob("#{File.dirname(__FILE__)}/../../apps/search/tmp/cache/geoserver/*.properties.csv")

time_of_start = Time.now
puts "#{csv_files.length} files to load into the database"
puts "starting data load process #{time_of_start}"

csv_files.each_with_index do |file, i|
  filename = File.basename(file)
  tablename = "feature_data_#{(filename.match(/[^\.]*/)[0]).gsub('-','_')}"
  time = Time.now

  puts "start #{time}, file number #{i}, filename #{filename}"

  headers = []
  CSV.open(file, { :headers => true }).each_with_index do |row, i|
    if i == 0
      row.each { |r| headers.push(r[0]) }
    else
      break
    end
  end    
  headers = headers.map{|s| "\"#{s}\" varchar(255)"}.join(',')

  puts %x[#{connection_string} -c "CREATE TABLE #{tablename} (#{headers})"]
  puts %x[#{connection_string} -c "DELETE FROM #{tablename}"]  
  puts %x[#{connection_string} -c "COPY #{tablename} FROM '#{File.absolute_path(file)}' WITH CSV HEADER;"]
  
  puts "end #{Time.now - time}"
end

puts "end of data load process #{Time.now - time_of_start}"
