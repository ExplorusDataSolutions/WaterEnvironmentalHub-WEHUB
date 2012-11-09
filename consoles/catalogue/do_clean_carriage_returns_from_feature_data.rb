# A quick script to fix feature data tables that contain carriage returns, these characters were breaking the API and the tools

require 'csv'

def execute(query)
  connection_string = "psql -U catalogue -d catalogue_development"
#  puts "Executing: #{query}"
  result = %x[#{connection_string} -c "#{query}" -t]
  puts "Result: #{result}"
end

puts "- Dumping tables with carriage returns in columns"

CSV.foreach('tables_with_carriage_returns_in_columns.csv') do |row|
  puts "Working on #{row[0]}"
  if FileTest.file?("#{Dir.pwd}/tmp/#{row[0]}.dump.csv")
    puts "-- Dump file exists. Skipping CSV generation from #{row[0]}"
  else
    execute("COPY #{row[0]} TO '#{Dir.pwd}/tmp/#{row[0]}.dump.csv' WITH CSV HEADER;")
  end
end

puts "- Fixing carriage returns"

CSV.foreach('tables_with_carriage_returns_in_columns.csv') do |row|
  puts "-- Working on #{row[0]}"
  %x[sed -i.original ':a;N;$!ba;s/\\r\\n//g' #{Dir.pwd}/tmp/#{row[0]}.dump.csv]
end

puts "- Loading clean tables - tables without carriage returns"

CSV.foreach('tables_with_carriage_returns_in_columns.csv') do |row|
  puts "-- Working on #{row[0]}"

  if !FileTest.file?("#{Dir.pwd}/tmp/#{row[0]}.dump.csv")
    puts "-- Dump file does not exist. Aborting #{row[0]}"
  else
    execute("DROP TABLE #{row[0]};")

    drop_the_geom = false
    create_table_columns = ''
    CSV.open("#{Dir.pwd}/tmp/#{row[0]}.dump.csv", { :headers => true }) do |csv|
      csv.readline

      headers = csv.headers.clone

      a = headers
      bucket = {}
      a.each do |e|
        key = e.downcase.strip
        bucket[key] = bucket[key] ? bucket[key] += 1 : 1
      end

      has_duplicates = false
      bucket.values.each do |v|
        if v > 1
          has_duplicates = true
          break
        end
      end

      if has_duplicates
        puts "Has duplicates"
        a.reverse!
        a.each_with_index do |e, i|
          key = e.downcase.strip
          if bucket[key] > 1
            a[i] = "#{a[i]} #{bucket[key]-1}"
            bucket[key] -= 1
          end
        end
        a.reverse!

        headers = a
      end

      headers.each do |column_name|
        create_table_columns << " \"#{column_name.strip}\" varchar(255),"
        if column_name.strip == 'the_geom'
          drop_the_geom = true
        end
      end
    end

    create_table_columns.chop!
    create_table_columns.gsub!('"','\"')
    execute("CREATE TABLE #{row[0]} (#{create_table_columns})")
    
    execute("COPY #{row[0]} FROM '#{Dir.pwd}/tmp/#{row[0]}.dump.csv' WITH CSV HEADER;")

    if drop_the_geom
      puts "-- the_geom exists. Dropping geometry"
      execute("ALTER TABLE #{row[0]} DROP COLUMN \"the_geom\";")
    end
  end
end
