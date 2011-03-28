load 'mef_factory.rb'
load 'importer.rb'

temp_directory = 'tmp/mefs'

MefFactory.new(temp_directory).build_all
Importer.new(temp_directory).upload_all

puts "Refreshing cache"
url = URI.parse('http://localhost:3001/search/refresh')
http = Net::HTTP.new(url.host, url.port)
response = http.start {|http| http.get(url.to_s) }
puts response.body