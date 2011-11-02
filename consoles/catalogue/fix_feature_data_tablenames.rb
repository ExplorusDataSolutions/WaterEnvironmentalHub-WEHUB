require 'csv'

# Generate a CSV file of offending tablenames through psql
# 1) COPY (SELECT tablename FROM pg_tables WHERE tablename LIKE '%-%') TO '/projects/WEHub/consoles/catalogue/feature_data_to_fix.csv' WITH CSV HEADER;
# 2) ruby fix_feature_data.rb > alter_feature_data_tablenames.sql
# 3) psql -U catalogue -d catalogue_development -f alter_feature_data_tablenames.sql 
 
CSV.foreach('feature_data_to_fix.csv') do |row|
  tablename = row[0]
  if !tablename.nil? && tablename != 'tablename'
    puts "ALTER TABLE \"#{tablename}\" RENAME TO \"#{tablename.gsub('-','_')}\";"
  end
end
