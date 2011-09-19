require 'csv'

CSV.foreach('feature_data_to_fix.csv') do |row|
  tablename = row[0]
  if !tablename.nil? && tablename != 'tablename'
    puts "ALTER TABLE \"#{tablename}\" RENAME TO \"#{tablename.gsub('-','_')}\";"
  end
end
