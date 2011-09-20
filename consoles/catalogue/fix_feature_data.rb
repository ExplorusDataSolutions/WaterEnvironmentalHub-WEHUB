require 'csv'

# Generate a CSV file of offending tablenames through psql
# COPY tablename FROM pg_tables WHERE tablename LIKE '%-%'; TO '/projects/WEHub/consoles/catalogue/feature_data_to_fix.csv' WITH CSV HEADER;
 
CSV.foreach('feature_data_to_fix.csv') do |row|
  tablename = row[0]
  if !tablename.nil? && tablename != 'tablename'
    puts "ALTER TABLE \"#{tablename}\" RENAME TO \"#{tablename.gsub('-','_')}\";"
  end
end
