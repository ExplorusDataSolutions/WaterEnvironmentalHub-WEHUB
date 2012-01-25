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
    puts request
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
  
  layers = nil
  if layer_list && !layer_list.empty?
    layers = []
    if layer_list.is_a? Array
      layer_list.each do |layer|
        keywords.push(layer['name'])
        id = layer['id']
        if !(id.to_s.match(/^\d$/))
          keywords.push(id)
        end
        bbox = layer['bbox']
        
        if source == 'alberta_water_portal'
          layers.push({ 
            :layer_id => layer['layerid'], 
            :name => "#{layer['description']}, #{layer['field']}",
            :feature_period => "#{layer['begintime']} - #{layer['endtime']}", 
            :bounding_box => bbox['upperright']['longitude'].nil? ? nil : "#{bbox['upperright']['longitude']} #{bbox['upperright']['latitude']},#{bbox['bottomleft']['longitude']} #{bbox['bottomleft']['latitude']}" 
          })
        else
          layers.push({ 
            :layer_id => layer['id'], 
            :name => layer['name'],
            :feature_period => "#{layer['time']['begintime']} - #{layer['time']['endtime']}", 
            :bounding_box => "#{bbox['upperright']['longitude']} #{bbox['upperright']['latitude']},#{bbox['bottomleft']['longitude']} #{bbox['bottomleft']['latitude']}"
          })
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
    :dataset => {
      :name => service_hash['title'],
      :description => service_hash.key?('description') ? service_hash['description'] : keywords.join(', '),
      :feature_period  => time,
      :feature_source => source,
      :feature => { 
        :keywords => keywords.join(', '),
        :source_uri => source_uri,
        :bounding_box => bounding_box,
        :layers => layers
      }
    }
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
elsif ARGV[0] == 'alberta_water_portal'
  service_list_uri = "http://www.albertawater.com/awp/api/realtime/services"
  service_details_uri = "http://www.albertawater.com/awp/api/realtime/service/"
  source = 'alberta_water_portal'
end

service_list = (JSON.parse(http_get("#{service_list_uri}")))['servicelist']
service_list = [service_list] if !service_list.is_a? (Array)
puts "Discovered #{service_list.count} services for #{source} on #{service_list_uri} at #{Time.new}"
service_list.each do |service|
  service_id = service['id']
  service_uri = "#{service_details_uri}#{service_id}"

  if source == 'alberta_water_portal'
    layer_list = http_get(service_uri)
    layer_list = layer_list[(layer_list.rindex('>') + 1).. -1].strip unless layer_list.index('>').nil?
    layer_list = (JSON.parse(layer_list))
  else
    layer_list = (JSON.parse(http_get(service_uri)))['layerlist']
  end
  add_to_catalogue(source, service_uri, service, layer_list)
end
