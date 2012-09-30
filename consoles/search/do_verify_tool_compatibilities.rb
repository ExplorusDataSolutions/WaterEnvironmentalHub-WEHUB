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
  else
    response.error!
  end
end

result = execute("SELECT uuid FROM datasets WHERE uuid NOT IN (SELECT dataset_uuid AS uuid FROM tool_compatibilities);")
uuids = result.split(/\n/)
uuids.each do |uuid|
  uuid.strip!
  chart_url = "http://localhost/tools/chart_feature/#{uuid}.json"
  map_url = "http://localhost/api/feature/#{uuid}?output=json"
  table_url = "http://localhost/tools/table_feature/#{uuid}.html?page[start]=0&page[size]=100"
  
  supported_tools = []
  begin
    http_get(chart_url)
    supported_tools.push('graph')
  rescue Exception => ex
  end
  
  begin
    http_get(map_url)
    supported_tools.push('map')
  rescue Exception => ex
  end

  begin
    http_get(chart_url)    
    supported_tools.push('table')
  rescue Exception => ex
  end
  
  if !supported_tools.empty?
    puts "Supported tools: #{supported_tools}"
    puts post_json("http://localhost:3000/tools/compatibilities/#{uuid}", { :supported_tools => supported_tools })
  end
end
