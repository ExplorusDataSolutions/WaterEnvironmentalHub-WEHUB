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
          :latitude => "90",
          :longitude => "180" 
      },
      :bottomleft => {
          :latitude => "-90" ,
          :longitude => "-180" 
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
    
    if !response.body.empty?
      data = (JSON.parse(response.body))['data']
      if !data.nil? && !data.empty?
        puts "Layer #{layer['id']} on service #{service_id} returns data"
      end
    end
  rescue Exception => e
    puts "Failure on layer #{layer['id']} on service #{service_id}\n\t Exception: #{e}"
  end

end

geocens_base = 'http://wehub.geocens.ca:8182/wehub'

service_list = (JSON.parse(http_get("#{geocens_base}/services")))['servicelist']
puts "Discovered #{service_list.count} services on #{Time.new}"
service_list.each do |service|
  service_id = service['id']
  layer_list = (JSON.parse(http_get("#{geocens_base}/service/#{service_id}")))['layerlist']
  if layer_list.is_a? Array
    puts "Discovered #{layer_list.count} layers on service #{service_id}"
    layer_list.each do |layer|    
      get_geocens_data("#{geocens_base}", service_id, layer)
    end 
  else
    puts "Discovered 1 layer on service #{service_id}"
    get_geocens_data("#{geocens_base}", service_id, layer_list)
  end
end
