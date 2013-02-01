# A quick script to delete orphaned feature data. Some of the feature data in our database was inserted manually through third party tools. 
#  Which is how some non standard characters (like \r\n) made their into fieldnames. While fixing up the carriage returns I noticed that some feature_data tables 
#  don't contain any rows and don't have an association in the datasets table. This script cleans up that data.

# COPY (SELECT tablename FROM pg_tables WHERE tablename LIKE 'feature_data%') TO '/projects/WEHub/consoles/catalogue/all_feature_data_tables.csv' WITH CSV HEADER;

require 'csv'

def execute(query)
  connection_string = "psql -U catalogue -d catalogue_development"
  %x[#{connection_string} -c "#{query}" -t]
end

def has_dataset(uuid)
  execute("SELECT uuid FROM datasets WHERE uuid = '#{uuid}';").strip == uuid
end

orphaned_tables = 0
CSV.foreach('all_feature_data_tables.csv', :headers => :first_row, :return_headers => false) do |row|
  tablename = row[0]
  uuid = tablename.match(/feature_data_(\w*)/)[1].gsub(/_/,'-')
  if !has_dataset(uuid)
    orphaned_tables += 1
    count = execute("SELECT COUNT(*) FROM #{tablename};").strip
    puts "-- #{tablename} contains #{count} records"
    puts "-- dropping #{tablename}"
    puts "DROP TABLE #{tablename};"
  end
end

puts "--"

datasets_count = execute("SELECT COUNT(*) FROM datasets;").strip
puts "-- The datasets table contains #{datasets_count} records. Out of these records #{orphaned_tables} orphaned tables were found"
