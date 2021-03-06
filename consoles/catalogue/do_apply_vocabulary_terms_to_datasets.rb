require 'active_support/core_ext'
require 'net/http'

def execute(query)
  connection_string = "psql -U catalogue -d catalogue_development"
  %x[#{connection_string} -c "#{query}" -t]
end

def http_get(url_param)
  puts url_param
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = 1000
  response = http.start {|http| http.get(url.to_s) }
  
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    puts response.body
    response.error!
  end
  
  response.body
end

result = execute("SELECT uuid FROM datasets WHERE uuid NOT IN (SELECT dataset_uuid AS uuid FROM feature_vocabulary);")
uuids = result.split(/\n/)
uuids.each do |uuid|
  url = "http://localhost:3000/vocabulator/vocabularize/#{uuid.strip!}?format=json"
  begin
    result = JSON.parse(http_get(url))['message']
    puts result
  rescue
    puts "#{url}\nFailed to load"
  end
end
