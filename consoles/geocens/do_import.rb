require 'active_support/core_ext'
require 'net/http'

def http_get(url_param)
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  response = http.start {|http| http.get(url.to_s) }
  
  check_response(response)
  
  response.body
end

def check_response(response)
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    puts response.body
    response.error!  
  end
end

def add_to_catalogue(source_uri, service_hash)
  puts "Updating Catalogue"
  
  keywords = "#{service_hash['keywords']}, #{service_hash['title']}, #{service_hash['providername']}, #{service_hash['authorname']}"
  time = "#{Time.parse(service_hash['time']['begintime']).iso8601.split('T')[0]} - #{Time.parse(service_hash['time']['endtime']).iso8601.split('T')[0]}"
  bbox = service_hash['bbox']
  bounding_box = "#{bbox['upperright']['longitude']} #{bbox['upperright']['latitude']},#{bbox['bottomleft']['longitude']} #{bbox['bottomleft']['latitude']}"  
  
  request = { 
    :source => 'geocens', 
    :name => service_hash['title'], 
    :description => service_hash.key?('description') ? service_hash['description'] : keywords, 
    :keywords => keywords, 
    :source_uri => source_uri,
    :feature_period  => time,
    :bounding_box => bounding_box
  }
  
  url_param = 'http://localhost:3000/items/load_external_meta_content'
  timeout = 500
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  
  response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }

  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    puts service_hash
    puts response.body
    response.error!  
  end
      
  if response.body.chomp(' ').empty?
    puts "Failure, record for #{source_uri} was not updated"
  else 
    puts "Success, record for #{source_uri} updated"
  end
  
end

geocens_base = 'http://wehub.geocens.ca:8183/wehub'
service_list = (JSON.parse(http_get("#{geocens_base}/services")))['servicelist']
puts "Discovered #{service_list.count} services on #{Time.new}"
service_list.each do |service|
  service_id = service['id']
  service_uri = "#{geocens_base}/service/#{service_id}"
  
  add_to_catalogue(service_uri, service)
end
