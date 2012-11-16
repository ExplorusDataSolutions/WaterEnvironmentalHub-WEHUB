# A quick script to delete temp reprojection data. Temp reprojection tables are a by product of the reprojection tool found in the upload process

def execute(query)
  connection_string = "psql -U catalogue -d catalogue_development"
  %x[#{connection_string} -c "#{query}" -t]
end

tables = execute("SELECT tablename FROM pg_tables WHERE tablename LIKE 'temp_reprojection_%';").split(/\n/)

tables.each do |tablename|
  tablename.strip!
  puts "Dropping #{tablename}"
  puts execute("DROP TABLE #{tablename};")
end
