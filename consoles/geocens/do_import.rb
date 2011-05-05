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

def get_geocens_data(url_param, service_id, layer)

  geocens_request = { 
    :request => "getdata", 
    :serviceid => service_id, 
    :layerid => layer['id'], 
    :time => { 
      :begintime => "#{layer['time']['begintime']}",
      :endtime => "#{layer['time']['endtime']}" 
    },
    :bbox => {
      :upperright => {
          :longitude => "#{layer['bbox']['upperright']['longitude']}",
          :latitude => "#{layer['bbox']['upperright']['latitude']}"
      },
      :bottomleft => {
          :longitude => "#{layer['bbox']['bottomleft']['longitude']}",
          :latitude => "#{layer['bbox']['bottomleft']['latitude']}"
      }
    }
  }
  
  begin
    timeout = 500
    url = URI.parse(url_param)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, geocens_request.to_json, { 'Content-Type' => 'application/json'}) }
  
    check_response(response)
        
    return true
  rescue Exception => e
    puts "Failure on layer #{layer['id']} on service #{service_id}\n\t Exception: #{e}"
  end
  
  return nil
end

def add_to_catalogue(source_uri, service_hash)
  puts "Updating Catalogue"
  
  keywords = "#{service_hash['keywords']}, #{service_hash['title']}, #{service_hash['providername']}, #{service_hash['authorname']}"

  request = { 
    :source => 'geocens', 
    :name => service_hash['title'], 
    :description => service_hash['description'], 
    :keywords => keywords, 
    :source_uri => source_uri
  }

  url_param = 'http://localhost:3000/items/load_external_meta_content'
  timeout = 500
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  
  response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }

  check_response(response)
    
  if response.body.chomp(' ').empty?
    puts "Failure, record for #{source_uri} was not updated"
  else 
    puts "Success, record for #{source_uri} updated"
  end
  
end

geocens_base = 'http://wehub.geocens.ca:8182/wehub'
service_list = (JSON.parse(http_get("#{geocens_base}/services")))['servicelist']
puts "Discovered #{service_list.count} services on #{Time.new}"
service_list.each do |service|
  service_id = service['id']
  service_uri = "#{geocens_base}/service/#{service_id}"
  
  add_to_catalogue(service_uri, service)
  layer_list = (JSON.parse(http_get(service_uri)))['layerlist']
  if layer_list.is_a? Array
    puts "Discovered #{layer_list.count} layers on service #{service_id}"
    layer_list.each do |layer|    
      if !get_geocens_data("#{geocens_base}", service_id, layer).nil?
        add_to_catalogue(service_uri, service)
      end  
    end 
  else
    puts "Discovered 1 layer on service #{service_id}"
    if !get_geocens_data("#{geocens_base}", service_id, layer_list).nil?
      add_to_catalogue(service_uri, service)
    end  
  end
end
