require 'csv'

csv_files = Dir.glob("#{File.dirname(__FILE__)}/tmp/*.csv")
csv_files.delete_if { |f| f.match(/properties/) }

time_of_start = Time.now
puts "#{csv_files.length} files to extract properties from"
puts "starting extraction process #{time_of_start}"

csv_files.each_with_index do |file, i|
  filename = File.basename(file)
  time = Time.now

  puts "start #{time}, file number #{i}, filename #{filename}"

  File.open("#{File.dirname(__FILE__)}/tmp/#{File.basename(file).gsub('.csv','.properties.csv')}", "w") do |f|
    CSV.foreach(file) do |row|
      f.puts(row[1..-2].join(","))
    end    
  end
  
  puts "end #{Time.now - time}"
end

puts "end of extraction process #{Time.now - time_of_start}"
