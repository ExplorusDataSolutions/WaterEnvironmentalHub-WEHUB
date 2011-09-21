require 'active_support/core_ext'
require 'net/http'

def http_get(url_param)
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
  else
    puts service_hash
    puts response.body
    response.error!
  end
      
  if response.body.strip.empty?
    puts "Failure, record for #{uri} was not updated"
  else 
    puts "Success, record for #{uri} updated"
  end
end

def format_date(date)
  result = date.match(/(?<year>\d*)-(?<month>\d*)-(?<day>\d*)/)
  year = result[:year]
  month = result[:month]
  day = result[:day]
  if month.nil? || month.to_i > 12
    month = 1
  end
  if day.nil? || day.to_i > 31
    day = 1
  end
  Time.parse("#{year}-#{month}-#{day}").iso8601.split('T')[0]  
end

def add_to_catalogue(source, source_uri, service_hash, layer_list)
  
  keywords = []
  if service_hash['keywords'] && !service_hash['keywords'].empty?
    service_hash['keywords'].split(',').each do |word|
      keywords.push(word.strip)
    end
  end
  
  if layer_list && !layer_list.empty?
    if layer_list.is_a? Array
      layer_list.each do |layer|
        keywords.push(layer['name'])
        id = layer['id']
        if !(id.to_s.match(/^\d$/))
          keywords.push(id)
        end
      end
    else
      keywords.push(layer_list['name'])
      id = layer_list['id']
      if !(id.to_s.match(/^\d$/))
        keywords.push(id)
      end
    end
  end
  
  if service_hash['title'] && !service_hash['title'].empty?
    keywords.push(service_hash['title'])
  end
  
  if service_hash['providername'] && !service_hash['providername'].empty?
    providername = service_hash['providername']
    if providername.scan(/-/).nil?
      keywords.push(providername)
    else
      providername.split('-').each do |part|
        keywords.push(part.strip)
      end
    end
  end
  
  if service_hash['authorname'] && !service_hash['authorname'].empty?
    keywords.push(service_hash['authorname'])
  end
  
  keywords.delete('')
  keywords.uniq!

  time = ''
  if service_hash['time']
    time = "#{format_date(service_hash['time']['begintime'])} - #{format_date(service_hash['time']['endtime'])}"
  end

  bbox = service_hash['bbox']
  bounding_box = "#{bbox['upperright']['longitude']} #{bbox['upperright']['latitude']},#{bbox['bottomleft']['longitude']} #{bbox['bottomleft']['latitude']}"  
  
  request = { 
    :source => source, 
    :name => service_hash['title'], 
    :description => service_hash.key?('description') ? service_hash['description'] : keywords, 
    :keywords => keywords.join(', '),
    :source_uri => source_uri,
    :feature_period  => time,
    :bounding_box => bounding_box
  }
  
  puts "-------"
  puts request
  puts "-------"  
  
  post_json('http://localhost:3000/items/load_external_meta_content', request)
end

if ARGV[0] == 'geocens'
  service_list_uri = "http://wehub.geocens.ca:8183/wehub/services"
  service_details_uri = 'http://wehub.geocens.ca:8183/wehub/service/'
  source = "geocens"
elsif ARGV[0] == 'water_cloud'
  service_list_uri = "http://136.159.79.145:12321/services/"
  service_details_uri = "http://136.159.79.145:12321/service/"
  source = "water_cloud"
end

service_list = (JSON.parse(http_get("#{service_list_uri}")))['servicelist']
puts "Discovered #{service_list.count} services for #{source} on #{service_list_uri} at #{Time.new}"
service_list.each do |service|
  service_id = service['id']
  service_uri = "#{service_details_uri}#{service_id}"
  layer_list = (JSON.parse(http_get(service_uri)))['layerlist']
  add_to_catalogue(source, service_uri, service, layer_list)
end
