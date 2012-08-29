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
  response = http.start {|http| http.get(url.to_s) }
  
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    puts service_hash
    puts response.body
    response.error!
  end
  
  response.body
end

def post_json(uri, request)
  puts "Updating Catalogue"
  timeout = 500
  url = URI.parse(uri)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  
  response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }

  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Success, record for #{uri} updated"
  else
    puts "Failure, record for #{uri} was not updated"
  end
      

end

result = execute("SELECT uuid FROM datasets WHERE uuid NOT IN (SELECT dataset_uuid AS uuid FROM feature_vocabulary);")
uuids = result.split(/\n/)
uuids.each do |uuid|
  vocabulary = JSON.parse(http_get("http://localhost:3000/vocabulator/vocabularize/#{uuid.strip!}?format=json"))['results']
  if !vocabulary.empty?
    result = post_json("http://localhost:3000/feature/update?id=#{uuid}", {:vocabulary => vocabulary })
    puts result
  end
end
