require 'csv'

file = CSV.open('/tmp/carriage_returns.csv')
file.each do |result|

  puts "ALTER TABLE #{result[0]} RENAME COLUMN \"#{result[1].gsub('@',"^M
")}\" TO \"#{result[1].gsub('@','')}\";"

end
