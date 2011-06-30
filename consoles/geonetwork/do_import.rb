require_relative 'mef_factory.rb'
require_relative 'importer.rb'
require 'pathname'

temp_directory = "#{Pathname.new(File.dirname(__FILE__))}/tmp/mefs"
puts "Deleting old mefs"
%x[rm -rf #{temp_directory}]
%x[mkdir -p #{temp_directory}]

puts "Building mefs"
MefFactory.new(temp_directory).build_all
puts "Uploading mefs"
Importer.new(temp_directory).upload_all

puts "Refreshing cache"
url = URI.parse('http://localhost:80/search/refresh')
http = Net::HTTP.new(url.host, url.port)
response = http.start {|http| http.get(url.to_s) }
puts response.body

puts "Prime cache"
url = URI.parse('http://localhost:80/search')
http = Net::HTTP.new(url.host, url.port)
response = http.start {|http| http.get(url.to_s) }
