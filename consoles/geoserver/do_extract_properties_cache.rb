require 'csv'

json_files = Dir.glob("#{File.dirname(__FILE__)}/tmp/*.csv")
json_files.each do |file|
  filename = File.basename(file)
  time = Time.now

  if !filename.match(/properties/)
    puts "start #{time} #{filename}"

    property_data = {}

    File.open("#{File.dirname(__FILE__)}/tmp/#{File.basename(file).gsub('.csv','.properties.csv')}", "w") do |f|
      CSV.foreach(file) do |row|
        f.puts(row[1..-2].join(","))
      end    
    end
    
    puts "end #{Time.now - time}"
  end 
end
