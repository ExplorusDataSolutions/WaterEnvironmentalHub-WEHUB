require 'csv'
require 'net/http'
require 'hashie'
require 'active_support/core_ext'
require 'rexml/document'

def get(uri)
  timeout = 500

  url = URI.parse(uri)    
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout    
  response = http.start {|http| http.get(url.request_uri) }

  response.value
  response.body
end

def xml_to_hash(value)
  Hashie::Mash.new(Hash.from_xml(value))
end

CSV.foreach('dataset_list.csv') do |row|
  uuid = row[1]
  if !uuid.nil? && uuid.length == 36
    response = xml_to_hash(get("http://waterenvironmentalhub.ca:3000/items/?id=#{uuid}&format=xml"))
    coordinates = response[:dataset][:coordinates]
    if coordinates.nil? || coordinates.empty?
      puts row
    end
  ond
end
